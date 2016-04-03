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
    
    // TODO something is wrong here (cf unit test)
    var parentNode: DescriptorNode? {
        didSet {
            if (parentNode?.childNodes == nil) {
                parentNode?.childNodes = []
            }
            parentNode!.childNodes.append(self)
        }
    }
    // TODO something is wrong here (cf unit test)
    var childNodes: [DescriptorNode] = [] {
        willSet {
            for childNode in childNodes {
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