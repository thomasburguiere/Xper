//
//  ItemNode.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class ItemNode {
    var item: Item?
    var name: String?
    var detail: String?
    var tree: ItemTree?
    
    private var parentNode: ItemNode?
    private var childNodes: [ItemNode] = []
    
    init(item: Item) {
        self.item = item
    }
    
    func getParentNode() -> ItemNode? {
        return self.parentNode
    }
    
    func setParentNode(parentNode: ItemNode) {
        self.parentNode = parentNode;
        parentNode.childNodes.append(self);
        
    }
    
    func getChildNodes() -> [ItemNode] {
        return self.childNodes
    }
    
    func setChildNodes(childNodes:[ItemNode]) {
        for childNode in  childNodes {
            childNode.setParentNode(self);
        }
        self.childNodes = childNodes;
    }
 
}