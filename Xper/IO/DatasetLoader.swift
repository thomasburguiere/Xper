//
//  DatasetLoader.swift
//  Xper
//
//  Created by Thomas Burguiere on 26/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation


import UIKit
import XperFramework

class DatasetLoader {
    
    var delegate: DatasetLoaderDelegate?
    var documentsPath: String {
        return  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    }
    
    func loadExistingDataset(named datasetName: String) {
        if let datasetPath = XperSingleton.instance.datasetsPathsDictionnary[datasetName] {
            let fileData = NSData(contentsOfURL: NSURL(fileURLWithPath: datasetPath))
            
            let parser = SddNSXMLParser()
            
            if let dataset = parser.parseDataset(fileData) {
                // loading dataset in UI
                self.delegate?.datasetLoader(self, didLoadDataset: dataset)
            }
        }
        
    }
    
    func loadDatasetDataFromLoadedUrl(url: NSURL) {
        let fileData = NSData(contentsOfURL: url)
        let parser = SddNSXMLParser()
        if let dataset = parser.parseDataset(fileData) {
            // writing dataset to disk, and saving a ref
            let datasetFileName = dataset.name! + ".sdd"
            self.saveDatasetToDisk(fileData, withName: datasetFileName)
            
            // loading dataset in UI
            self.delegate?.datasetLoader(self, didLoadDataset: dataset)
            
        }
    }
    
    func loadDatasetFromRemoteUrl(url: NSURL?) {
        
        // 1
        let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        // 2
        var dataTask: NSURLSessionDataTask?
        

        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        // 5
        dataTask = defaultSession.dataTaskWithURL(url!) {
            data, response, error in
            // 6
            dispatch_async(dispatch_get_main_queue()) {
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                // 7
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? NSHTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        let parser = SddNSXMLParser()
                        if let dataset = parser.parseDataset(data) {
                            
                            // loading dataset in UI
                            self.delegate?.datasetLoader(self, didLoadDataset: dataset)
                            
                            // writing dataset to disk, and saving a ref
                            let datasetFileName = dataset.name! + ".sdd"
                            self.saveDatasetToDisk(data, withName: datasetFileName)
                            
                        }
                    }
                }
            }
        }
        // 8
        dataTask?.resume()
    }
    
    private func saveDatasetToDisk(data: NSData?, withName datasetFileName: String) {
        let datasetFilePath = self.documentsPath + "/" + datasetFileName
        do {
            try data?.writeToFile(datasetFilePath, options: .AtomicWrite)
            XperSingleton.instance.datasetsPathsDictionnary[datasetFileName] = datasetFilePath
        }
        catch  {
            
        }
    }

}