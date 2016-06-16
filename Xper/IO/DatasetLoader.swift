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
        return  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as String
    }

    func listExistingDatasets() {
        let fileManager = FileManager.default()
        let enumerator = fileManager.enumerator(atPath: documentsPath)
        while let element = enumerator?.nextObject() as? String {
            if element.hasSuffix("sdd") { // checks the extension
                print (element)
            }
        }
    }
    
    func loadExistingDataset(named datasetName: String) {
        if let datasetPath = XperSingleton.instance.datasetsPathsDictionnary[datasetName] {
            let fileData = try? Data(contentsOf: URL(fileURLWithPath: datasetPath))
            
            let parser = SddNSXMLParser()
            
            if let dataset = parser.parseDataset(fileData) {
                // loading dataset in UI
                self.delegate?.datasetLoader(self, didLoadDataset: dataset)
            }
        }
    }
    
    func loadDatasetDataFromLoadedUrl(_ url: URL) {
        let fileData = try? Data(contentsOf: url)
        let parser = SddNSXMLParser()
        if let dataset = parser.parseDataset(fileData) {
            // writing dataset to disk, and saving a ref
            let datasetFileName = dataset.name! + ".sdd"
            self.saveDatasetToDisk(fileData, withName: datasetFileName)
            
            // loading dataset in UI
            self.delegate?.datasetLoader(self, didLoadDataset: dataset)
            
        }
    }
    
    func loadDatasetFromRemoteUrl(_ url: URL?) {
        
        // 1
        let defaultSession = URLSession(configuration: URLSessionConfiguration.default())
        // 2
        var dataTask: URLSessionDataTask?
        

        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.shared().isNetworkActivityIndicatorVisible = true
        
        // 5
        dataTask = defaultSession.dataTask(with: url!) {
            data, response, error in
            // 6
            DispatchQueue.main.async {
                UIApplication.shared().isNetworkActivityIndicatorVisible = false
                
                // 7
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse {
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
    
    private func saveDatasetToDisk(_ data: Data?, withName datasetFileName: String) {
        let datasetFilePath = self.documentsPath + "/" + datasetFileName
        do {
            try data?.write(to: URL(fileURLWithPath: datasetFilePath), options: .atomicWrite)
            XperSingleton.instance.datasetsPathsDictionnary[datasetFileName] = datasetFilePath
        }
        catch  {
            
        }
    }

}
