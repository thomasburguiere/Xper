//
//  XperTabController.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class XperTabController: UITabBarController, ItemsDatasource, DescriptorsDatasource, DatasetLoaderDelegate, MainInfoDatasource {
    
    var dataset: Dataset?
    var itemsViewController: ItemsViewControllerProtocol?
    var descriptorsViewController: DescriptorsViewControllerProtocol?
    var descriptionsViewController: DescriptionsViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let fileToOpenUrl = XperSingleton.instance.fileToOpenURL {
            loadOpenedData(fileToOpenUrl)
        } else {
            loadSampleData()
        }
        
        XperSingleton.instance.datasetLoader.delegate = self
        setupControllers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    // MARK: MainInfoDataSource
    func getItemsCount() -> Int? {
        return dataset?.items.count
    }
    func getDescriptorsCount() -> Int? {
        return dataset?.descriptors.count
    }
    func getDatasetName() -> String? {
        return dataset?.name
    }
    
    // MARK: DatasetLoaderDelegate
    func datasetLoader(datasetLoader: DatasetLoader, didLoadDataset dataset: Dataset) {
        self.dataset = dataset
        itemsViewController?.reload()
        descriptorsViewController?.reload()
        let mainViewController = self.viewControllers![0] as! MainViewController
        mainViewController.displayDatasetData()
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
        self.descriptorsViewController = descriptorsViewController
    }
    
    
    // MARK: private functions
    
    private func setupControllers() {
        if let viewControllers = self.viewControllers {
            let mainViewController = viewControllers[0] as! MainViewController
            mainViewController.datasource = self
            
            let itemViewController = viewControllers[1] as! ItemsNavigationController
            itemViewController.itemsDatasource = self
            itemViewController.descriptorsDatasource = self
            
            let descriptorViewController = viewControllers[2] as! DescriptorsNavigationController
            descriptorViewController.datasource = self
            
            let descriptionsViewController = viewControllers[3] as! DescriptionsViewController
            descriptionsViewController.itemsDatasource = self
            descriptionsViewController.descriptorsDatasource = self
            self.descriptionsViewController = descriptionsViewController
        }
    }
    
    private func loadOpenedData(openedFileUrl: NSURL) {
        let sampleFileData = NSData(contentsOfURL: openedFileUrl)
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
    }
    
    private func loadSampleData() {
        XperSingleton.instance.datasetLoader.listExistingDatasets()
        let sampleFilePath = NSBundle.mainBundle().pathForResource("genetta", ofType: "sdd.xml")
        let sampleFileData = NSData(contentsOfFile: sampleFilePath!)
        let filePath = (NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String) + "/" + "genetta.sdd"
        do {
            try sampleFileData?.writeToFile(filePath, options: .AtomicWrite)
            XperSingleton.instance.datasetsPathsDictionnary["genetta"] = sampleFilePath
        }
        catch  {
            
        }
        let parser = SddNSXMLParser()
        dataset = parser.parseDataset(sampleFileData)
    }


}

