//
//  MainViewControllerDelegate.swift
//  Xper
//
//  Created by Thomas Burguiere on 12/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation
import XperFramework

protocol MainViewControllerDelegate {
    func mainViewController(mainViewController: MainViewController, didLoadDataset dataset: Dataset)
}
