//
//  EditProfileVC.swift
//  Car-Book
//
//  Created by Devgan on 12/09/23.
//

import UIKit
import CountryPickerIOS

class EditProfileVC: BaseClassVC {

  @IBOutlet weak var tView: UITextView!

  @IBOutlet weak var txtNIn: UITextField!
  @IBOutlet weak var txtPhone: UITextField!
  @IBOutlet weak var txtLastName: UITextField!
  @IBOutlet weak var txtFirstName: UITextField!
  @IBOutlet var viewMobile: UIView!
  @IBOutlet weak var txtLanguage: UITextField!

  let placeholderText = "Tell people about yourself"
  // MARK: - Properties
  var countryPickerView: CountryPickerView?
  var code = "+234"


    override func viewDidLoad() {
        super.viewDidLoad()
      tView.delegate = self
      txtPhone.delegate = self
      self.tView.text = self.placeholderText
      self.tView.textColor = .systemGray2
      self.getProfile()
    }

  // MARK: - Methods
  func setCountryTxtField() {

    countryPickerView = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 80, height: txtPhone.bounds.height))
    countryPickerView?.setCountryByPhoneCode(code)
      countryPickerView?.delegate = self
    txtPhone.leftView = countryPickerView
    txtPhone.leftViewMode = .always
  }

  override func viewWillAppear(_ animated: Bool) {
    self.getProfile()
  }
  
  @IBAction func btnBack(_ sender:UIButton) {
    self.navigationController?.popViewController(animated: true)
  }

  @IBAction func btnUpdate(_ sender: Any) {
    self.updateProfile()

  }

  // MARK: - Methods
  func getProfile(){
      reqUser.getProfileAPi { user, res, errCode in
        DispatchQueue.main.async { [self] in

          self.txtFirstName.text = user?.firstName
          self.txtLastName.text = user?.lastName
          self.txtPhone.text = user?.phone
          self.txtNIn.text = user?.ninNumber
          self.txtLanguage.text = user?.language
          code = user?.countryCode ?? ""
          setCountryTxtField()
          if tView.text == "" {
            self.tView.text = self.placeholderText
            self.tView.textColor = .systemGray2
          }else{
            self.tView.text = user?.description
            self.tView.textColor = .black

          }
         }
      }
    }

  func updateProfile() {
    if Helper.shared.isFieldEmpty(field: txtNIn.text ?? "") {
        DisplayBanner.show(message: "Enter NIN Number")
        return
    }
    if Helper.shared.isFieldEmpty(field: txtLanguage.text ?? "") {
        DisplayBanner.show(message: "Enter Language")
        return
    }
    if Helper.shared.isFieldEmpty(field: tView.text ?? "") {
        DisplayBanner.show(message: "Enter your description")
        return
    }

    self.view.showLoadingIndicator()
    reqUser.firstName = txtFirstName.text ?? ""
    reqUser.lastName = txtLastName.text ?? ""
    reqUser.phone = txtPhone.text ?? ""
    reqUser.language = txtLanguage.text ?? ""
    reqUser.ninNumber = txtNIn.text ?? ""
    reqUser.description = tView.text
    reqUser.countryCode = code
    reqUser.updateProfile { [self] loginUser, errMsg, errCode in
        DispatchQueue.main.async {
            self.view.hideLoadingIndicator()
            if errCode == 200 {
                self.showAlertMsgAction(errMsg) {
                   let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                    let targetVC = sb.instantiateViewController(withIdentifier: "ViewProfileVC")
                  self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.showAlertMsg(errMsg)
            }
        }
    }
  }
}

extension EditProfileVC : UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
      if tView.text == placeholderText {
      //  self.tView.textColor = .systemGray2
        tView.text = ""
          }
      return true
  }

  func textViewDidEndEditing(_ textView: UITextView) {
      if tView.text.isEmpty {
        tView.text = placeholderText
        self.tView.textColor = .systemGray2
      }
  }

  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
      self.tView.textColor = .black
      if(self.tView.text == placeholderText) {
          self.tView.text = ""
       // self.tView.textColor = .systemGray2
      }
      return true
  }
}

extension EditProfileVC : CountryPickerListDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        debugPrint("Selected country \(country)")
        code =  country.phoneCode
    }

    func showCountryList(output: CountryPickerListOutput) {
        let countryList = CountryPickerList(style: .insetGrouped)
        countryList.output = output
        self.navigationController?.present(countryList, animated: true)
    }
}

// MARK: - TextFieldDelegate
extension EditProfileVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = txtPhone.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 12
    }
}
