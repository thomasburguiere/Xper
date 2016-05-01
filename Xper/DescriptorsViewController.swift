//
//  DescriptorsViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorsViewController: UIViewController {
    
    var descriptors: [Descriptor]?
    
    @IBOutlet weak var descriptorCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        descriptorCount.text = "\(descriptors!.count)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}