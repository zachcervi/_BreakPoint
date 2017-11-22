//
//  Message.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/17/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import Foundation

class Message {
    private var _content: String
    private var _senderID: String
    
    var content: String{
        return _content
    }
    
    var senderID: String{
        return _senderID
    }
    
    init(content: String, senderID: String){
        self._content = content
        self._senderID = senderID
    }
}
