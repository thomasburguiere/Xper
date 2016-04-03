//
//  Node.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Node<T: Treeable> {
    var object: T?
    var name: String?
    var detail: String?
    var tree: Tree<T>?
    
    
    private var parentNode: Node<T>?
    private var childNodes: [Node<T>] = []
    
    init(object: T) {
        self.object = object
    }
    
    func getParentNode() -> Node<T>? {
        return self.parentNode
    }
    
    func setParentNode(parentNode: Node<T>) {
        self.parentNode = parentNode;
        parentNode.childNodes.append(self);
        
    }
    
    func getChildNodes() -> [Node<T>] {
        return self.childNodes
    }
    
    func setChildNodes(childNodes:[Node<T>]) {
        for childNode in  childNodes {
            childNode.setParentNode(self);
        }
        self.childNodes = childNodes;
    }
}