//
//  DescriptorDetailViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 03/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DescriptorDetailViewController: UIViewController, UINavigationControllerDelegate {
    var descriptor: Descriptor?
    
    @IBOutlet weak var descriptorDetailText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let descriptor = descriptor {
            navigationItem.title = descriptor.name
            if let detailString = descriptor.detail {
                descriptorDetailText.setHTMLFromString(detailString)
            }
        }
        
    }
}