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
    
    
    func loadDatasetDataFromLoadedUrl(url: NSURL) {
        let fileData = NSData(contentsOfURL: url)
        let parser = SddNSXMLParser()
        if let dataset = parser.parseDataset(fileData) {
            delegate?.datasetLoader(self, didLoadDataset: dataset)
        }
    }
    
    func loadDatasetFromRemoteUrlString(urlString: String) {
        
        var dataset: Dataset?
        // 1
        let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        // 2
        var dataTask: NSURLSessionDataTask?
        

        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: urlString)
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
                        dataset = parser.parseDataset(data)
                        self.delegate?.datasetLoader(self, didLoadDataset: dataset!)
                    }
                }
            }
        }
        // 8
        dataTask?.resume()
    }

}