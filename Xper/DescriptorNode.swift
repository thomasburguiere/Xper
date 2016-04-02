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
    var name: String?
    var detail: String?
    
    
    var parentNode: DescriptorNode? {
        didSet {
            parentNode!.childNodes.append(self)
        }
    }
    var childNodes: [DescriptorNode] = [] {
        didSet {
            for childNode in self.childNodes {
                childNode.parentNode = self
            }
        }
    }
    var inapplicableStates: [State]?
    var resources: [Resource]?
    
    init(descriptor: Descriptor){
        self.descriptor = descriptor
        self.inapplicableStates = []
        self.resources = []
    }
    
    func addChildNode(childNode:DescriptorNode) {
        childNode.parentNode = self
    }
}