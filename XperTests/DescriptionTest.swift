//
//  DescriptionTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 11/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import XCTest
@testable import Xper

class DescriptionTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_description_with_categorical_is_complete() {
        let description = Description()
        let descriptor = CategoricalDescriptor(name:"descriptor")
        descriptor.states = [State(name:"a"), State(name:"b")]
        
        let des = DescriptionElementState()
        des.selectedStates = []
        description.descriptionElements = [descriptor:des]
        XCTAssertFalse(description.isDescriptionComplete())
        
        des.selectedStates.append(State(name:"c"))
        XCTAssertTrue(description.isDescriptionComplete())
        
    }
    
    func test_description_with_quantitative_is_complete() {
        let description = Description()
        let descriptor = QuantitativeDescriptor(name:"descriptor")
        
        let qm = QuantitativeMeasure()
        
        
        
        let des = DescriptionElementState()
        des.quantitativeMeasure = qm
        description.descriptionElements = [descriptor:des]
        XCTAssertFalse(description.isDescriptionComplete())
        
        qm.max = 2.0
        qm.min = 1.0
        XCTAssertTrue(description.isDescriptionComplete())
        
    }

}
