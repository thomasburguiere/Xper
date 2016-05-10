//
//  MainViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation


import UIKit
import XperFramework

class MainViewController : UIViewController {
    var dataset: Dataset?
    
    @IBOutlet weak var datasetLabel: UILabel!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var descriptorsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let dataset = self.dataset {
            datasetLabel.text = dataset.name
            itemsLabel.text = String(dataset.items.count)
            descriptorsLabel.text = String(dataset.descriptors.count)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}