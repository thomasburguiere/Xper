//
//  ItemDetailViewController.swift
//  Xper
//
//  Created by Thomas Burguiere on 02/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class ItemDetailViewController: UIViewController, UINavigationControllerDelegate {
    var item: Item?
    
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBAction func cancel(sender: AnyObject) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        //        nameTextField.delegate = self
        
        // set up views if editing existing meal
        if let item = item {
            navigationItem.title = item.name
//            nameTextField.text = meal.name
//            photoImageView.image = meal.photo
//            ratingControl.rating = meal.rating
        }
        
    }
}

