//
//  GroupsFeedVC.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/21/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit
import Firebase

class GroupsFeedVC: UIViewController {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTextField: InsetTextField!
    @IBOutlet weak var sendBtnView: UIView!
    @IBOutlet weak var membersLbl: UILabel!
    
    var group: Group?
    var groupMessages = [Message]()
    func initDataForGroup(forGroup group: Group){
        self.group = group
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtnView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsForGroup(group: self.group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath.init(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            })
        }
        
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTextField.text != ""{
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: Auth.auth().currentUser!.uid, withGroupKey: group?.key, sendComplete: { (complete) in
                if(complete){
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                
                }
            })
        }
    }
    
}

extension GroupsFeedVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else{
            return UITableViewCell()
        }
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderID) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
        }
        return cell
       
    }
}
