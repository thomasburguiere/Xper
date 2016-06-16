//
//  DescriptorTableViewDatasource.swift
//  Xper
//
//  Created by Thomas Burguiere on 12/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation
import XperFramework

protocol DescriptorsDatasource {
    func getDescriptors() -> [Descriptor]?
    func register(descriptorsViewController: DescriptorsViewControllerProtocol)
}
