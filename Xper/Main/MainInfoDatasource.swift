//
//  MainInfoDatasource.swift
//  Xper
//
//  Created by Thomas Burguiere on 26/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation
import XperFramework

protocol MainInfoDatasource {
    func getDatasetName() -> String?
    func getItemsCount() -> Int?
    func getDescriptorsCount() -> Int?
}