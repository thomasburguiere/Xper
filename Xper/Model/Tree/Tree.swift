//
//  Tree.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Tree<T: Treeable> {
    
    var name: String?
    var detail: String?
    var type: TreeType = .Other
    var nodes: [Node<T>] = []
    
    func getRootNodes() -> [Node<T>] {
        var rootNodes = [Node<T>]()
        for node in nodes {
            if node.getParentNode() == nil {
                rootNodes.append(node)
            }
        }
        
        return rootNodes
    }
    
    func addNode(node: Node<T>) {
        nodes.append(node)
        node.tree = self
    }
    
    func addNodes(nodes: [Node<T>]) {
        for node in nodes {
            addNode(node)
        }
    }
    
    func removeNode(nodeToRemove: Node<T>) {
        nodes = nodes.filter({$0 !== nodeToRemove})
        nodeToRemove.tree = nil
    }
    
    func removeNodes(nodesToRemove: [Node<T>]) {
        for nodeToRemove in nodesToRemove {
            removeNode(nodeToRemove)
        }
    }
}