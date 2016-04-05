//
//  DatasetObjectWithResources.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

protocol DatasetObjectWithResources {
    var resources: [Resource]  {get set}
}
extension DatasetObjectWithResources {
    mutating func addResource(resourcesToAdd: Resource) {
        resources.append(resourcesToAdd)
        resourcesToAdd.object = self
    }
    
    
    mutating func addResources(addedResources: [Resource]) {
        for resource in addedResources {
            addResource(resource)
        }
    }
    
    mutating func removeResource(deletedResource: Resource) {
        resources = resources.filter({ (resource: Resource) -> Bool in
            if(resource === deletedResource){
                deletedResource.object = nil
                return false
            } else {
                return true
            }
        })
    }
    
    mutating func removeAllResources() {
        for resource in resources {
            resource.object = nil
        }
        resources = []
    }
    
}
