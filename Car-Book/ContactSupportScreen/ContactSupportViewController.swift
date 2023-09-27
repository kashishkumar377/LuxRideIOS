//
//  ContactSupportViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class ContactSupportViewController: BaseClassVC {
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var viewTitle: UIView!
    @IBOutlet var viewEmail: UIView!
    @IBOutlet var viewDescription: UIView!

    @IBOutlet weak var tView: UITextView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTitle: UITextField!

  let placeholderText = "Description"

    override func viewDidLoad() {
        super.viewDidLoad()
        tView.delegate = self
       tView.text = placeholderText
       tView.textColor = .lightGray
        btnSubmit.layer.cornerRadius = 10
        viewTitle.layer.cornerRadius = 10
        viewEmail.layer.cornerRadius = 10
        
        viewEmail.layer.borderWidth = 1.0
        viewEmail.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
        
        viewTitle.layer.borderWidth = 1.0
        viewTitle.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
        
        viewDescription.layer.borderWidth = 1.0
        viewDescription.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

  func ContactSupport(){
    if Helper.shared.isFieldEmpty(field: txtTitle.text ?? "") {
        DisplayBanner.show(message: "Please enter title")
        return
    }
    if Helper.shared.isValidEmailAddress(candidate: txtEmail.text ?? "") {
        DisplayBanner.show(message: ErrorMessages.alertValidEmail)
        return
    }

      self.view.showLoadingIndicator()
      reqUser.email = txtEmail.text ?? ""
      reqUser.description = tView.text ?? ""
      reqUser.title = txtTitle.text ?? ""
      reqUser.contactSupport {loginUser, errMsg, errCode in
          DispatchQueue.main.async {
              self.view.hideLoadingIndicator()
            if errCode == 200 {
                self.showAlertMsgAction(errMsg) {
                   let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                    let targetVC = sb.instantiateViewController(withIdentifier: "ProfileViewController")
                  self.navigationController?.popViewController(animated: true)
                }
            } else {
                self.showAlertMsg(errMsg)
            }

          }
      }
  }

  @IBAction func submitAction(_ sender: Any) {
    ContactSupport()
  }
}


extension ContactSupportViewController : UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
      if tView.text == placeholderText {
        tView.text = ""
      }
      return true
  }

  func textViewDidEndEditing(_ textView: UITextView) {
      if tView.text.isEmpty {
        tView.text = placeholderText
      }
  }

  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
       self.tView.textColor = .black
       if(self.tView.text == placeholderText) {
          self.tView.text = ""
      }
       return true
  }
}
