//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/21/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
