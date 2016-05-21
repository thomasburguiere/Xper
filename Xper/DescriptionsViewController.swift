//
//  DescriptionsViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptionsViewController: UIViewController, DescriptorsViewControllerProtocol, ItemsViewControllerProtocol {
    
    var itemsDatasource: ItemsDatasource?
    var descriptorsDatasource: DescriptorsDatasource?
    
    func reload() {
        // TODO
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemsDatasource?.register(itemsViewController: self)
        descriptorsDatasource?.register(descriptorsViewController: self)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}