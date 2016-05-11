//
//  XperTabController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class XperTabController: UITabBarController, NSURLConnectionDelegate {
    
    var dataset: Dataset?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleData()
        
        setupControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSampleData() {
        let sampleFilePath = NSBundle.mainBundle().pathForResource("corals", ofType: "sdd.xml")
        let sampleFileData = NSData(contentsOfFile: sampleFilePath!)
        
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
    }

    
    private func setupControllers() {
        if let viewControllers = self.viewControllers {
            let mainViewController = viewControllers[0] as! MainViewController
            mainViewController.dataset = self.dataset
            
            let itemViewController = viewControllers[1] as! ItemsNavigationController
            itemViewController.items = dataset?.items
            
            
            let descriptorViewController = viewControllers[2] as! DescriptorsNavigationController
            descriptorViewController.descriptors = dataset?.descriptors
        }
    }


}

