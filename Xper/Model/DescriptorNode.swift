//
//  DescriptorNode.swift
//  Xper
//
//  Created by Thomas Burguiere on 02/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class DescriptorNode {
    var descriptor: Descriptor
    var tree: DescriptorTree?
    var name: String?
    var detail: String?
    
    private var parentNode: DescriptorNode?
    private var childNodes: [DescriptorNode] = []
    
    var inapplicableStates: [State]?
    var resources: [Resource]?
    
    init(descriptor: Descriptor){
        self.descriptor = descriptor
        self.inapplicableStates = []
        self.resources = []
    }
    
    func getParentNode() -> DescriptorNode? {
        return self.parentNode
    }
    
    func setParentNode(parentNode: DescriptorNode) {
        self.parentNode = parentNode;
        parentNode.childNodes.append(self);
        
    }
    
    func getChildNodes() -> [DescriptorNode] {
        return self.childNodes
    }
    
    func setChildNodes(childNodes:[DescriptorNode]) {
        for childNode in  childNodes {
            childNode.setParentNode(self);
        }
        self.childNodes = childNodes;
    }
    
    func addChildNode(childNode:DescriptorNode) {
        childNode.parentNode = self
    }
}