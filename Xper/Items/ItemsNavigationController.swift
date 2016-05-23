//
//  ItemsNavigationController.swift
//  Xper
//
//  Created by Thomas Burguiere on 02/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemsNavigationController: UINavigationController {
    var itemsDatasource: ItemsDatasource?
    var descriptorsDatasource: DescriptorsDatasource?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let itemListController = self.viewControllers[0] as! ItemsTableViewController
        itemListController.itemsDatasource = itemsDatasource
        itemListController.descriptorsDatasource = descriptorsDatasource
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
