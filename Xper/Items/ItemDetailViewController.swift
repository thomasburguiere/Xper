//
//  ItemDetailViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 02/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework
import MapleBacon
import Agrume

class ItemDetailViewController: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    var item: Item?
    var descriptorsDatasource: DescriptorsDatasource?
    
    
    @IBOutlet weak var firstItemImageView: UIImageView!
    @IBOutlet weak var itemDetailText: UITextView!
    
    func openImage(sender: UITapGestureRecognizer) {
        if let image = firstItemImageView.image {
            let agrume = Agrume(image: image)
            agrume.showFrom(self)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            navigationItem.title = item.name
            if let detailString = item.detail {
                itemDetailText.setHTMLFromString(detailString)
            } else {
                itemDetailText.setHTMLFromString("")
            }
            let imageResource = item.resources.filter{$0.type == .Image}.first
            if imageResource != nil {
                if let imageURL = imageResource?.url {
                    firstItemImageView.setImageWithURL(imageURL)
                }
            }
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ItemDetailViewController.openImage(_:)))
        tapGestureRecognizer.delegate = self
        firstItemImageView.userInteractionEnabled = true
        firstItemImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK Navigation setup
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showItemDescription" {
            let itemDescriptionViewController = segue.destinationViewController as! ItemDescriptionViewController
            itemDescriptionViewController.item = item
            itemDescriptionViewController.descriptorsDatasource = descriptorsDatasource
            
        }
    }
}


