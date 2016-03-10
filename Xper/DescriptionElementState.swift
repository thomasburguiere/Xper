//
//  DescriptionElementState.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class DescriptionElementState {
    var selectedStates: [State] = []
    var quantitativeMeasure: QuantitativeMeasure?
    var unknown: Bool = false
    var contextualWeigh: Int = 3
}