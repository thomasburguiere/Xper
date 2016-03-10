//
//  Descriptor.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

func ==(lhs: Descriptor, rhs: Descriptor) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
class Descriptor: Hashable {
    
    var name: String
    var quality: String?
    var detail: String?
    var globalWeight: Int = 3
    
    init(name:String) {
        self.name = name
    }
    
    // MARK: Hashable
    var hashValue : Int {
        get {
            return "\(self.name)".hashValue
        }
    }
    
}