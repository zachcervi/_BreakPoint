//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/17/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    func configureCell(profileImg: UIImage, email: String, content: String){
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
