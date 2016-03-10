//
//  Item.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Item : DatasetObjectWithResources {
    var name: String
    var alterNativeName: String?
    var resources: [Resource]

    func addResource(addedResource: Resource) {
        resources.append(addedResource)
    }

    func removeResrouce(deletedResource: Resource) {
    }

    func deleteAllResources() {
        resources = []
    }

    init(name:String){
        self.name = name
        self.resources = []
    }
    
    func aaa() -> String {
        return name + alterNativeName!
    }
}
