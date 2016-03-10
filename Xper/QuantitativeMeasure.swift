//
//  QuantitativeMeasure.swift
//  Xper
//
//  Created by Thomas Burguiere on 11/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class QuantitativeMeasure {
    var max: Float?
    var min: Float?
    var mean: Float?
    var sd: Float?
    
    var minInclusive: Bool = true
    var maxInclusive: Bool = true
    
    var computedMin: Float? {
        if min != nil {
            return min!
        } else if sd != nil && mean != nil {
            return mean! - 2 *  sd!
        }
        return nil
    }
    
    var computedMax: Float? {
        if max != nil {
            return max!
        } else if sd != nil && mean != nil {
            return mean! + 2 *  sd!
        }
        return nil
    }
}