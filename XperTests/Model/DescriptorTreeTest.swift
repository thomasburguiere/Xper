//
//  DescriptorTreeTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

import XCTest
@testable import Xper

class DescriptorTreeTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_getRootNodes() {
        let desc1 = Descriptor(name: "desc1")
        let descNode1 = DescriptorNode(descriptor: desc1)
        
        
        let desc11 = Descriptor(name: "desc11")
        let desc12 = Descriptor(name: "desc12")
        let descNode11 = DescriptorNode(descriptor: desc11)
        let descNode12 = DescriptorNode(descriptor: desc12)
        
        descNode1.setChildNodes([descNode11, descNode12])
        
        let descT = DescriptorTree()
        descT.nodes = [descNode11, descNode1, descNode12]
        
        XCTAssertTrue(descT.getRootNodes().count == 1)
        XCTAssertTrue(descT.getRootNodes()[0] === descNode1)
    }

    
}