//
//  DatasetObjectWithResourceTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 05/04/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

import XCTest
@testable import Xper

class DatasetObjectWithResourceTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_that_computedMin_equals_min_if_defined() {
        let qm = QuantitativeMeasure()
        qm.min = 1.5
        qm.max = 9.0
        qm.sd = 4.3
        qm.mean = 3.2
        XCTAssertEqual(qm.computedMin, qm.min)
    }
}