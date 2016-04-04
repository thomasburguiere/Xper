//
//  Dataset.swift
//  Xper
//
//  Created by Thomas Burguiere on 04/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Dataset {
    var name: String?
    var detail: String?
    var authors: [String] = []
    var associatedWebsite: String?
    var copyright: String?
    var creationDate: NSDate?
    
    var descriptors: [Descriptor] = []
    var items: [Item] = []
    var itemTrees: [Tree<Item>] = []
    var descriptorTrees: [Tree<Descriptor>] = []
    var resources: [Resource] = []
    
    var upToDate = true
    init(name: String) {
        self.name = name
    }
    
    func getDescriptorByName(descriptorName: String) -> [Descriptor] { 
        return descriptors.filter{ (d: Descriptor) -> Bool in
            return d.name == descriptorName
        }
    }
}
