//
//  ItemTableViewCell.swift
//  Xper
//
//  Created by Thomas Burguiere on 01/05/16.
//  Copyright © 2016 Thomas Burguiere. All rights reserved.
//

import UIKit

extension UITextView {
    func setHTMLFromString(_ text: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: \(self.font!.fontName); font-size: \(self.font!.pointSize)\">%@</span>" as NSString, text) as String
        do{
            let attrStr = try NSAttributedString(
                data: modifiedFont.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
                options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8],
                documentAttributes: nil)
            
            self.attributedText = attrStr
        }
        catch {
            self.text = text
        }
    }
}
