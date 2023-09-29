//
//  BrandColorViewController.swift
//  CarHub
//
//  Created by Apple on 01/09/22.
//

import UIKit
import IGColorPicker


protocol ColorListVCsDelegate
{
    func getSelectedColorValue(value:String,screen:String,type:String)
}

class BrandColorViewController: UIViewController, ColorPickerViewDelegate, ColorPickerViewDelegateFlowLayout {

    @IBOutlet weak var selectedColorView: UIView!
    @IBOutlet weak var colorPickerView: ColorPickerView!

    var delegateRef : ColorListVCsDelegate? = nil

    var firstColour : String?
    var tableType : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Brand color"

        // Setup selectedColorView
        selectedColorView.layer.cornerRadius = selectedColorView.frame.width/2

        // Setup colorPickerView
        colorPickerView.delegate = self
        colorPickerView.layoutDelegate = self
        colorPickerView.style = .circle
        colorPickerView.layer.borderWidth = 0.3
        colorPickerView.layer.borderColor = UIColor.gray.cgColor
        colorPickerView.layer.masksToBounds = true
        colorPickerView.selectionStyle = .check
        colorPickerView.isSelectedColorTappable = false
        colorPickerView.preselectedIndex = colorPickerView.colors.indices.first

        selectedColorView.backgroundColor = colorPickerView.colors.first
        }

    @IBAction func actionVack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }


    // MARK: - ColorPickerViewDelegate

    func colorPickerView(_ colorPickerView: ColorPickerView, didSelectItemAt indexPath: IndexPath) {
        if firstColour == "First" {
            self.selectedColorView.backgroundColor = colorPickerView.colors[indexPath.item]
            print(colorPickerView.colors[indexPath.item])
            let colorr = colorPickerView.colors[indexPath.item]
            let hexString = colorr.toHexString()
            print(hexString)
          //  UserStoreSingleton.shared.selectUIColor = String(colorPickerView.colors[indexPath.item])
            delegateRef?.getSelectedColorValue(value: hexString, screen: "Color", type: "First")

            self.navigationController?.popViewController(animated: true)
        }else{
            self.selectedColorView.backgroundColor = colorPickerView.colors[indexPath.item]
            print(colorPickerView.colors[indexPath.item])
            let colorr = colorPickerView.colors[indexPath.item]
            let hexString = colorr.toHexString()
            print(hexString)
          //  UserStoreSingleton.shared.selectUIColor = String(colorPickerView.colors[indexPath.item])
            delegateRef?.getSelectedColorValue(value: hexString, screen: "Color", type: "Second")

            self.navigationController?.popViewController(animated: true)
        }

    }

    // MARK: - ColorPickerViewDelegateFlowLayout

    func colorPickerView(_ colorPickerView: ColorPickerView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 48, height: 48)
    }

    func colorPickerView(_ colorPickerView: ColorPickerView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }

    func colorPickerView(_ colorPickerView: ColorPickerView, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func colorPickerView(_ colorPickerView: ColorPickerView, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

}
extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

}
