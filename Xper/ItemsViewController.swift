//
//  ItemsViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemsViewController: UIViewController {
    
    var items: [Item]?
    
    @IBOutlet weak var itemCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        itemCount.text = "\(items!.count)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}