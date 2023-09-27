//
//  Shadow.swift
//  Car-Book
//
//  Created by Devgan on 13/09/23.
//

import Foundation
import UIKit



@IBDesignable extension UIView {
    @IBInspectable var shadowColor: UIColor?{
        set {
            guard let uiColor = newValue else { return }
            layer.shadowColor = uiColor.cgColor
        }
        get{
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
    }


  // Shadow
  @IBInspectable var shadow: Bool {
       get {
            return layer.shadowOpacity > 0.0
       }
       set {
            if newValue == true {
                 self.addShadow()
            }
       }
  }

fileprivate func addShadow(shadowColor: CGColor = UIColor.gray.cgColor, shadowOffset: CGSize = CGSize(width: 1.0, height: 0.0), shadowOpacity: Float = 0.1, shadowRadius: CGFloat = 2.0) {
       let layer = self.layer
       layer.masksToBounds = false

       layer.shadowColor = shadowColor
       layer.shadowOffset = shadowOffset
       layer.shadowRadius = shadowRadius
       layer.shadowOpacity = shadowOpacity
       layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath

       let backgroundColor = self.backgroundColor?.cgColor
       self.backgroundColor = nil
       layer.backgroundColor =  backgroundColor
  }


  // Corner radius
  @IBInspectable var circle: Bool {
       get {
            return layer.cornerRadius == self.bounds.width*0.5
       }
       set {
            if newValue == true {
                 self.cornerRadius = self.bounds.width*0.5
            }
       }
  }

    @IBInspectable var shadowOpacity: Float{
        set {
            layer.shadowOpacity = newValue
        }
        get{
            return layer.shadowOpacity
        }
    }

    @IBInspectable var shadowOffset: CGSize{
        set {
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }

    @IBInspectable var shadowRadius: CGFloat{
        set {
            layer.shadowRadius = newValue
        }
        get{
            return layer.shadowRadius
        }
    }

  @IBInspectable var cornerRadius: CGFloat {
       get {
            return self.layer.cornerRadius
       }

       set {
            self.layer.cornerRadius = newValue
       }
  }

    @IBInspectable var borderWidth: CGFloat {
      get {
          return layer.borderWidth
      }
      set {
          layer.borderWidth = newValue
      }
    }

    
}
