//
//  XperSingleton.swift
//  Xper
//
//  Created by Thomas Burguiere on 26/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class XperSingleton {
    
    static let sharedInstance = XperSingleton()
    
    var fileToOpenURL: NSURL?
    var datasetLoader = DatasetLoader()
    
}