//
//  QuantitativeMeasure.swift
//  Xper
//
//  Created by Thomas Burguiere on 11/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class QuantitativeMeasure {
    var max: Double?
    var min: Double?
    var mean: Double?
    var sd: Double?
    
    var minInclusive: Bool = true
    var maxInclusive: Bool = true
    
    var computedMin: Double? {
        if min != nil {
            return min!
        } else if sd != nil && mean != nil {
            return mean! - 2 *  sd!
        }
        return nil
    }
    
    var computedMax: Double? {
        if max != nil {
            return max!
        } else if sd != nil && mean != nil {
            return mean! + 2 *  sd!
        }
        return nil
    }
    
    var isFilled: Bool {
        return computedMax != nil && computedMin != nil
    }
    
    func contains(otherQm: QuantitativeMeasure?) -> Bool {
        if otherQm == nil {
            return false;
        } else if (isFilled && otherQm!.isFilled){
            if(maxInclusive) {
                if(otherQm?.computedMin >= computedMin && otherQm?.computedMin <= computedMax) ||
                   (otherQm?.computedMax >= computedMin && otherQm?.computedMax <= computedMax) {
                    return true
                }
            } else {
                if (otherQm?.computedMin >= computedMin && otherQm?.computedMin < computedMax) ||
                    (otherQm?.computedMax >= computedMax && otherQm?.computedMax < computedMax){
                    return true
                }
            }
        }
        return false
    }
    
    func isGreaterThan(value: Double, comparingIntervals: Bool) -> Bool? {
        if isFilled  {
            if(comparingIntervals) {
                return computedMin > value
            }
            return mean != nil ? mean > value : false
        }
        return nil
    }
    
    func isGreaterThan(otherQm: QuantitativeMeasure, comparingIntervals: Bool, strictly: Bool) -> Bool? {
        if isFilled && otherQm.isFilled {
            if comparingIntervals {
                if strictly {
                    return computedMin > otherQm.computedMax
                } else {
                    return computedMin >= otherQm.computedMax
                }
            } else {
                return mean != nil && otherQm.mean != nil ? mean > otherQm.mean : nil
            }
        }
        return nil
    }
}