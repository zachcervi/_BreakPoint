//
//  Group.swift
//  BreakPoint
//
//  Created by Zach Cervi on 11/21/17.
//  Copyright © 2017 Zach Cervi. All rights reserved.
//

import Foundation

class Group {
    private var _groupTitle: String
    private var _groupDescription: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    public var groupTitle: String {
        return _groupTitle
    }
    
    public var groupDescription: String{
        return _groupDescription
    }
    
    public var key: String{
        return _key
    }
    
    public var memberCount: Int{
        return _memberCount
    }
    public var members: [String]{
        return _members
    }
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        self._groupTitle = title
        self._groupDescription = description
        self._key = key
        self._members = members
        self._memberCount = memberCount
    }
}
