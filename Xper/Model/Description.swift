//
//  Description.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class Description {
    var descriptionElements : [Descriptor : DescriptionElementState]?
    
    func isDescriptionComplete() -> Bool {
        for (descriptor, descriptionElementState) in descriptionElements! {
            if(!descriptionElementState.unknown) {
                if(descriptor.dynamicType === CategoricalDescriptor.self){
                    if(descriptionElementState.selectedStates.count == 0){
                        return false
                    }
                } else if (descriptor.dynamicType === QuantitativeDescriptor.self) {
                    if(descriptionElementState.quantitativeMeasure == nil ||
                    descriptionElementState.quantitativeMeasure!.computedMin == nil ||
                        descriptionElementState.quantitativeMeasure!.computedMax == nil) {
                            return false
                    }
                }
            }
        }
        return true
    }
}