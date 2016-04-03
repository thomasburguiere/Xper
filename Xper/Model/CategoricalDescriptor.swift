//
//  CategoricalDescriptor.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class CategoricalDescriptor : Descriptor {
    var states : [State]
    
    override init(name:String) {
        states = []
        super.init(name: name)
    }
    
    init(name: String, states: [State]){
        self.states = states
        super.init(name: name)
    }
}