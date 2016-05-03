//
//  ItemTableViewCell.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit
import XperFramework

class DatasetObjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var objectName: UILabel!
    @IBOutlet weak var objectDescription: UITextView!
//    @IBOutlet weak var objectImage: UIImageView!
}



extension UITextView {
    func setHTMLFromString(text: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize)\">%@</span>", text) as String
        do{
            let attrStr = try NSAttributedString(
                data: modifiedFont.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding],
                documentAttributes: nil)
            
            self.attributedText = attrStr
        }
        catch {
            self.text = text
        }
    }
}