//
//  Item.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Item : DatasetObjectWithResources, Treeable {
    var name: String
    var alterNativeName: String?
    var description : Description?

    init(name:String){
        self.name = name
    }
    
    
}
