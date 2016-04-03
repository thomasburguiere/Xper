//
//  ItemTree.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class ItemTree {
    
    var name: String?
    var detail: String?
    var type: Type = Type.Other
    var nodes: [ItemNode] = []
    
    func getRootNodes() -> [ItemNode] {
        var rootNodes = [ItemNode]()
        for node in nodes {
            if node.getParentNode() == nil {
                rootNodes.append(node)
            }
        }
        return rootNodes
    }
    
    func addNode(node: ItemNode) {
        nodes.append(node)
        node.tree = self
    }
    
    enum Type {
        case Rank
        case Other
    }
}