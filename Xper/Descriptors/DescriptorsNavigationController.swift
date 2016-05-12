//
//  DescriptorsNavigationController.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorsNavigationController: UINavigationController {
    var datasource: DescriptorTableViewDatasource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let descriptorsTableViewController = self.viewControllers[0] as! DescriptorsTableViewController
        descriptorsTableViewController.datasource = datasource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
