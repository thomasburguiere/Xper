//
//  TreeTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

import XCTest
@testable import Xper

class TreeTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func test_getRootNodes_for_Item() {
        let item1 = Item(name: "item1")
        let itemNode1 = Node<Item>(object: item1)
        
        
        let item11 = Item(name: "item11")
        let item12 = Item(name: "item12")
        let itemNode11 = Node<Item>(object: item11)
        let itemNode12 = Node<Item>(object: item12)
        
        itemNode1.setChildNodes([itemNode11, itemNode12])
        
        let itemT = Tree<Item>()
        itemT.nodes = [itemNode11, itemNode1, itemNode12]
        
        XCTAssertTrue(itemT.getRootNodes().count == 1)
        XCTAssertTrue(itemT.getRootNodes()[0] === itemNode1)
    }
    
    func test_addNode_sets_the_nodes_tree_for_Item() {
        let item1 = Item(name: "item1")
        let itemNode1 = Node<Item>(object: item1)
        
        let itemT = Tree<Item>()
        itemT.addNode(itemNode1)
        
        XCTAssertTrue(itemNode1.tree! === itemT)
        
    }
    
    
    func test_getRootNodes_for_Descriptor() {
        let item1 = Descriptor(name: "item1")
        let itemNode1 = Node<Descriptor>(object: item1)
        
        
        let item11 = Descriptor(name: "item11")
        let item12 = Descriptor(name: "item12")
        let itemNode11 = Node<Descriptor>(object: item11)
        let itemNode12 = Node<Descriptor>(object: item12)
        
        itemNode1.setChildNodes([itemNode11, itemNode12])
        
        let itemT = Tree<Descriptor>()
        itemT.nodes = [itemNode11, itemNode1, itemNode12]
        
        XCTAssertTrue(itemT.getRootNodes().count == 1)
        XCTAssertTrue(itemT.getRootNodes()[0] === itemNode1)
    }
    
    func test_addNode_sets_the_nodes_tree_for_Descriptor() {
        let item1 = Descriptor(name: "item1")
        let itemNode1 = Node<Descriptor>(object: item1)
        
        let itemT = Tree<Descriptor>()
        itemT.addNode(itemNode1)
        
        XCTAssertTrue(itemNode1.tree! === itemT)
        
    }

}
