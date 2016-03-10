//
//  Resource.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit

class Resource {
    var name: String
    var type: Type
    var url: NSURL?
    var thumbnail: UIImage?
    
    init(name:String) {
        self.name = name
        self.type = .Unknown
    }
    
    enum Type {
        case Image
        case Sound
        case Video
        case Unknown
    }
}