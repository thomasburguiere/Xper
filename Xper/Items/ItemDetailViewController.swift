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
            let detailString = item.detail
            itemDetailText.setHTMLFromString(detailString!)
            
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
}

