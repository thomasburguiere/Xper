//
//  DatasetObjectWithResources.swift
//  Xper
//
//  Created by Thomas Burguiere on 10/03/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import Foundation

protocol DatasetObjectWithResources {
    var resources: [Resource] {get set}
    func addResource (addedResource: Resource)
    func removeResource (deletedResource: Resource)
    func deleteAllResources()
}