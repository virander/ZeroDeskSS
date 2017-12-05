//
//  ZD_HelperExtension.swift
//  ZeroDeskiOS
//
//  Created by Apple  on 16/11/17.
//  Copyright © 2017 Apple . All rights reserved.
//

import Foundation
import UIKit

extension Float {
    func asCurrencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // formatter.currencyCode = "USD"
        formatter.locale = Locale(identifier: "en_US")
        // formatter.locale = NSLocale.currentLocale()
        return formatter.string(from: self as NSNumber)!
    }
}

extension Double {
    func asCurrencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // formatter.currencyCode = "USD"
        formatter.locale = Locale(identifier: "en_US")
        // formatter.locale = NSLocale.currentLocale()
        if let formattedStr = formatter.string(from: self as NSNumber) {
            return formattedStr
        } else {
            return "$0.00"
        }
    }
}
extension Int {
    var degreesToRadians: Double { return Double(self) * Double.pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / Double.pi }
}


extension UIButton{
    
    func addShadow (_ color : UIColor, radius : CGFloat, cornerRadius : CGFloat)
    {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
    }
}

extension String {
    
    func removeZeros() -> String {
        if self.hasSuffix(".0") {
            return self.substringToIndex(self.length - 2)
        }
        return self
    }
    func substringFromIndex(_ index: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: index))
    }
    func substringToIndex(_ index: Int) -> String {
        return self.substring(to: self.characters.index(self.startIndex, offsetBy: index))
    }
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func validateEmail() -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func validateUrl() -> Bool {
        
        let urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [urlRegEx])
        return predicate.evaluate(with: self)
    }
    
    func validateZip() -> Bool {
        let zipRegEx = "^\\d{5}(-\\d{4})?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", zipRegEx)
        return predicate.evaluate(with: self)
    }
    
    func isAlphanumeric() -> Bool {
        let letters = CharacterSet.letters
        let digits = CharacterSet.decimalDigits
        
        var letterCount = 0
        var digitCount = 0
        
        for uni in self.unicodeScalars {
            if letters.contains(UnicodeScalar(uni.value)!) {
                letterCount += 1
            } else if digits.contains(UnicodeScalar(uni.value)!) {
                digitCount += 1
            }
        }
        if letterCount > 0 && digitCount > 0 {
            return true
        }
        return false
    }
    
    
    var length: Int {
        return characters.count
    }
    
    func insertString(_ string: String, ind: Int) -> String {
        return String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count - ind))
        /*
         var str = String(self.characters.prefix(ind)) + string
         printDebug("str = \(str)")
         if self.characters.count-ind > 0{
         str += String(self.characters.suffix(self.characters.count-ind))
         printDebug("str2 = \(str)")
         }
         return str
         */
    }
    
}


extension UIColor {
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
