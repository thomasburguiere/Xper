//
//  ViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class XperTabController: UITabBarController, NSURLConnectionDelegate {
    
    var dataset: Dataset?
    var data = NSMutableData()

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
        let sampleFilePath = NSBundle.mainBundle().pathForResource("corals", ofType: "sdd.xml")
        let sampleFileData = NSData(contentsOfFile: sampleFilePath!)
        
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
        
        setupControllers()
    }
    
    func loadSampleDataFromUrl() {
        let urlString = "https://www.dropbox.com/s/tr7kon3uc4b7tpq/genetta.sdd.xml?dl=1"
        
        let request = NSURLRequest(URL: NSURL(string: urlString)!)
        let connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)!
        connection.start()
        
    }
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!)  {
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(self.data)
        setupControllers()
    }
    
    private func setupControllers() {
        if let viewControllers = self.viewControllers {
            let itemViewController = viewControllers[0] as! ItemsNavigationController
            itemViewController.items = dataset?.items
            
            
            let descriptorViewController = viewControllers[1] as! DescriptorsNavigationController
            descriptorViewController.descriptors = dataset?.descriptors
        }
    }


}

