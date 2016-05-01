//
//  ViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class XperTabController: UITabBarController {
    
    var dataset: Dataset?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadSampleData() {
        let sampleFilePath = NSBundle.mainBundle().pathForResource("genetta", ofType: "sdd.xml")
        let sampleFileData = NSData(contentsOfFile: sampleFilePath!)
        
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
        
        if let viewControllers = self.viewControllers {
            let itemViewController = viewControllers[0] as! ItemsViewController
            itemViewController.items = dataset?.items
            
            
            let descriptorViewController = viewControllers[1] as! DescriptorsViewController
            descriptorViewController.descriptors = dataset?.descriptors
        }
    }


}

