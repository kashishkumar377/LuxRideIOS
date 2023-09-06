//
//  Helper.swift
//  LabSearch
//
//  Created by Caksu Sethi on 12/01/23.
//

import Foundation
import UIKit
typealias TBLDelegate = UITableViewDelegate & UITableViewDataSource
typealias PickerDelegate = UIPickerViewDelegate & UIPickerViewDataSource
typealias ImgPickerDelegate = UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        let viewController = self.instantiateViewController(withIdentifier: T.className)
        guard let typedViewController = viewController as? T else {
            fatalError("Unable to cast view controller of type (\(type(of: viewController))) to (\(T.className))")
        }
        return typedViewController
    }
}


extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
public extension UITableView {
  func register<C>(_ cellType: C.Type) where C: UITableViewCell {
    let name = String(describing: cellType.self)
    self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
  }
   
  func deque<C>(_ cellType: C.Type, at indexPath: IndexPath) -> C where C: UITableViewCell{
    let name = String(describing: cellType.self)
    let cell = self.dequeueReusableCell(withIdentifier: name, for: indexPath) as! C
    return cell
  }
    
    func dequeheader<C>(_ cellType: C.Type) -> C where C: UITableViewCell{
      let name = String(describing: cellType.self)
      let cell = self.dequeueReusableCell(withIdentifier: name) as! C
      return cell
    }
}

extension UICollectionView {
    func register<C>(_ cellType: C.Type) where C: UICollectionViewCell {
      let name = String(describing: cellType.self)
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
     
    func deque<C>(_ cellType: C.Type, at indexPath: IndexPath) -> C where C: UICollectionViewCell{
      let name = String(describing: cellType.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as! C
      return cell
    }
}

extension UIViewController {
    func returnString() -> [String] {
        var arr = [String]()
        for i in 1...100 {
            arr.append("\(i)")
        }
        return arr
    }
}
    
extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /** Loads instance from nib with the same name. */
    static func loadFromXib<T>(withOwner: Any? = nil, options: [UINib.OptionsKey : Any]? = nil) -> T where T: UIView
    {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
    
    //MARK: Function
    func makeRound(clip:Bool = false)
    {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = clip
        
    }
    
    func applyCircleShadow(shadowRadius: CGFloat = 2,
                           shadowOpacity: Float = 0.3,
                           shadowColor: CGColor = UIColor.black.cgColor,
                           shadowOffset: CGSize = CGSize.zero) {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = false
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
    
    func setOpicityView(onView:UIView,alpha:CGFloat = 0.5, color:UIColor = .black, Aperanc:Bool){
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            if Aperanc{
                let alphaView = UIView(frame: .zero)
                alphaView.frame = onView.frame
                alphaView.backgroundColor = UIColor.red.withAlphaComponent(alpha)//color.withAlphaComponent(alpha)
                alphaView.tag = 1322
                onView.addSubview(alphaView)
                self.bringSubviewToFront(alphaView)

            }else{
                onView.subviews.first(where: {$0.tag == 1322})?.removeFromSuperview()

                
            }
        })
    }
   
}


@IBDesignable
open class DesignableView:UIView {
    @IBInspectable
    var clips : Bool{
        get {
             return clipsToBounds
        }set{
            clipsToBounds = newValue
        }
    }
    
    @IBInspectable
    var cornerRadiusValue: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            
            layer.cornerRadius = newValue
            layer.masksToBounds = true

            
        }
    
    }
    
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = false
            

        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.masksToBounds = false

        }
       
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.masksToBounds = false
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}


@IBDesignable
open class DesignableImageView:UIImageView {
    @IBInspectable
    var cornerRadiusValue: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true

            
        }
    
    }
    
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
}


@IBDesignable
open class DesignableButton:UIButton {
    @IBInspectable
      var clips : Bool{
          get {
               return clipsToBounds
          }set{
              clipsToBounds = newValue
          }
      }
    @IBInspectable
    var cornerRadiusValue: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true

            
        }
    
    }
    
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.masksToBounds = false

        }
       
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
                layer.masksToBounds = false
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


@IBDesignable
open class DesignableLabel:UILabel {
    @IBInspectable
    var cornerRadiusValue: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true

            
        }
    
    }
    
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = false

        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
}


@IBDesignable
class DesignableUITextField: UITextField {

    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
}



@IBDesignable
public class DesignableTextField: UITextField {
    
    // Provides left padding for images
    override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    
    @IBInspectable var borderColor: UIColor = UIColor.lightGray {
        didSet {
            self.layer.borderWidth = 1
            self.borderStyle = .none
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderCornerRadius: CGFloat = 4 {
        didSet {
            self.layer.borderWidth = 1
            self.borderStyle = .none
            self.layer.cornerRadius = borderCornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = 1
            self.borderStyle = .none
        }
    }
    
    @IBInspectable var textPadding: CGFloat = 0 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: textPadding, height: self.frame.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
    }
    
}

extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "ic_password_visible"), for: .normal)
        }else{
            button.setImage(UIImage(named: "ic_password_invisible"), for: .normal)
            
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 20), y: CGFloat(5), width: CGFloat(20), height: CGFloat(20))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}

func convertToInt(str : String) -> Int {
    
    return Int(str)!
    
}

extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }

    func isNumeric() -> Bool {
        
        //'/[a-zA-Z]/'
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z]", options: .caseInsensitive)
        
         return !(regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil)
    }
   
    func validateUrl () -> Bool {
        let urlRegEx = "((?:http|https)://)?(?:www\\.)?[\\w\\d\\-_]+\\.\\w{2,3}(\\.\\w{2})?(/(?<=/)(?:[\\w\\d\\-./_]+)?)?"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: self)
    }
}

extension String {
    func capitalizingFirst() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirst() {
        self = self.capitalizingFirst()
    }
    
    func trimmed() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}



extension StringProtocol {
    func masked(_ n: Int = 4, reversed: Bool = true) -> String {
        let mask = String(repeating: "*", count: Swift.max(0, count-n))
        return reversed ? mask + suffix(n) : prefix(n) + mask
    }
}

extension String {
    func getDate(_ from:String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.00000Z"
        let date = dateFormatter.date(from: from)
        
    }
    
}









