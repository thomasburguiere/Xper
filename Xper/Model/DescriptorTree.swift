//
//  DescriptorTree.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class DescriptorTree {
    
    var name: String?
    var detail: String?
    var type: Type = Type.Other
    var nodes: [DescriptorNode] = []
    
    func getRootNodes() -> [DescriptorNode] {
        var rootNodes = [DescriptorNode]()
        for node in nodes {
            if node.getParentNode() == nil {
                rootNodes.append(node)
            }
        }
        return rootNodes
    }
    
    func addNode(node: DescriptorNode) {
        nodes.append(node)
        node.tree = self
    }
    
    enum Type {
        case Other
        case Dependency
        case Group
    }
}


