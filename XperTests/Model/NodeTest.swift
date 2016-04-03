//
//  NodeTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

import XCTest
@testable import Xper

class NodeTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_childNodes_didSet() {
        let item1 = Item(name: "item1")
        let itemNode1 = Node<Item>(object: item1)
        
        
        let item11 = Item(name: "item11")
        let item12 = Item(name: "item12")
        let itemNode11 = Node<Item>(object: item11)
        let itemNode12 = Node<Item>(object: item12)
        
        itemNode1.setChildNodes([itemNode11, itemNode12])
        
        XCTAssertTrue(itemNode1 === itemNode11.getParentNode()!)
        XCTAssertTrue(itemNode1 === itemNode12.getParentNode()!)
    }
    
    func test_parentNode_didSet() {
        let item1 = Item(name: "item1")
        let itemNode1 = Node<Item>(object: item1)
        
        let item11 = Item(name: "item11")
        let itemNode11 = Node<Item>(object: item11)
        
        itemNode11.setParentNode(itemNode1)
        
        XCTAssertTrue(itemNode1.getChildNodes()[0] === itemNode11)
    }
    
    func test_childNodes_for_Descriptor() {
        let desc1 = Descriptor(name: "desc1")
        let descNode1 = Node<Descriptor>(object: desc1)
        
        
        let desc11 = Descriptor(name: "desc11")
        let desc12 = Descriptor(name: "desc12")
        let descNode11 =  Node<Descriptor>(object: desc11)
        let descNode12 =  Node<Descriptor>(object: desc12)
        
        descNode1.setChildNodes([descNode11, descNode12])
        
        XCTAssertTrue(descNode1 === descNode11.getParentNode()!)
        XCTAssertTrue(descNode1 === descNode12.getParentNode()!)
    }
    
    func test_parentNode_for_Descriptor() {
        let desc1 = Descriptor(name: "desc1")
        let descNode1 = Node<Descriptor>(object: desc1)
        
        let desc11 = Descriptor(name: "desc11")
        let descNode11 = Node<Descriptor>(object: desc11)
        
        descNode11.setParentNode(descNode1)
        
        XCTAssertTrue(descNode1.getChildNodes()[0] === descNode11)
    }
    
}