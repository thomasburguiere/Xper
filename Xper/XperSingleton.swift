//
//  XperSingleton.swift
//  Xper
//
//  Created by Thomas Burguiere on 26/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

class XperSingleton {
    
    static let instance = XperSingleton()
    
    var fileToOpenURL: URL?
    var datasetLoader = DatasetLoader()
    var datasetsPathsDictionnary = [String:String]()
    
}
