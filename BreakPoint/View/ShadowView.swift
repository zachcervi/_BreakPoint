//
//  ShadowView.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/16/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }

}
