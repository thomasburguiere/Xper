//
//  QuantitativeMeasureTest.swift
//  Xper
//
//  Created by Thomas Burguiere on 11/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import XCTest
@testable import Xper

class QuantitativeMeasureTest: XCTestCase {
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
    
    
    func test_that_computedMax_equals_max_if_defined() {
        let qm = QuantitativeMeasure()
        qm.min = 1.5
        qm.max = 9.0
        qm.sd = 4.3
        qm.mean = 3.2
        XCTAssertEqual(qm.computedMax, qm.max)
    }
    
    
    func test_that_computedMin_equals_mean_sd_if_not_defined() {
        let qm = QuantitativeMeasure()
        qm.sd = 4.3
        qm.mean = 3.2
        XCTAssertEqual(qm.computedMin!, qm.mean! - 2 * qm.sd!)
    }
    
    func test_that_computedMax_equals_mean_sd_if_not_defined() {
        let qm = QuantitativeMeasure()
        qm.sd = 4.3
        qm.mean = 3.2
        XCTAssertEqual(qm.computedMax!, qm.mean! + 2 * qm.sd!)
    }

  

}
