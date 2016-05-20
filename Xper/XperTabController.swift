//
//  XperTabController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class XperTabController: UITabBarController, MainViewControllerDelegate, ItemsDatasource, DescriptorsDatasource {
    
    var dataset: Dataset?
    var itemsViewController: ItemsViewControllerProtocol?
    var descriptorsViewControllers: [DescriptorsViewControllerProtocol]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleData()
        
        setupMainViewController()
        setupControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: MainViewControllerDelegate
    func mainViewController(mainViewController: MainViewController, didLoadDataset dataset: Dataset) {
        self.dataset = dataset
        itemsViewController?.reload()
        descriptorsViewControllers?.forEach{$0.reload()}
        setupControllers()
    }
    
    // MARK: ItemsDatasource
    func getItems() -> [Item]? {
        return dataset?.items
    }
    
    func register(itemsViewController itemsViewController: ItemsViewControllerProtocol) {
        self.itemsViewController = itemsViewController
    }
    
    // MARK: DescriptorsDatasource
    func getDescriptors() -> [Descriptor]? {
        return dataset?.descriptors
    }
    
    func register(descriptorsViewController descriptorsViewController: DescriptorsViewControllerProtocol) {
        self.descriptorsViewControllers?.append(descriptorsViewController)
    }
    
    
    // MARK: private functions
    private func setupMainViewController() {
        if let viewControllers = self.viewControllers {
            let mainViewController = viewControllers[0] as! MainViewController
            mainViewController.dataset = self.dataset
            mainViewController.delegate = self
        }
    }
    
    private func setupControllers() {
        if let viewControllers = self.viewControllers {
            let itemViewController = viewControllers[1] as! ItemsNavigationController
            itemViewController.datasource = self
            
            let descriptorViewController = viewControllers[2] as! DescriptorsNavigationController
            descriptorViewController.datasource = self
        }
    
    private func loadSampleData() {
        let sampleFilePath = NSBundle.mainBundle().pathForResource("corals", ofType: "sdd.xml")
        let sampleFileData = NSData(contentsOfFile: sampleFilePath!)
        
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
    }


}

