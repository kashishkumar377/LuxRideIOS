//
//  SignInSignUpViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit
import CountryPickerIOS
class SignInSignUpViewController: BaseClassVC {

    // MARK: - IBOutlets
    @IBOutlet var viewSignUp: UIView!
    @IBOutlet var viewSignIn: UIView!
    @IBOutlet var txtFieldFirstName: UITextField!
    @IBOutlet var txtFieldLastName: UITextField!
    @IBOutlet var txtFieldPassword: UITextField!
    @IBOutlet var txtFieldMobileNo: UITextField!
    @IBOutlet var txtFieldEmailSignIn: UITextField!
    @IBOutlet var txtFieldEmailSignUp: UITextField!
    @IBOutlet var txtFieldPasswordSignIn: UITextField!
    @IBOutlet var btnSignUp: UIButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var btnSignUpHeader: UIButton!
    @IBOutlet var btnSignInHeader: UIButton!
    @IBOutlet var viewSignInHeader: UIView!
    @IBOutlet var viewSignUpHeader: UIView!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var imgTopBackground: UIImageView!
    @IBOutlet var viewMobile: UIView!
    
    // MARK: - Properties
    var countryPickerView: CountryPickerView?
    var code = "+234"
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setCountryTxtField()
    }
    
    // MARK: - ViewWillAPPear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Methods
    func setCountryTxtField() {
        countryPickerView = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: txtFieldMobileNo.bounds.height))
        countryPickerView?.delegate = self
        txtFieldMobileNo.leftView = countryPickerView
        txtFieldMobileNo.leftViewMode = .always
    }
    
    func setupUI() {
        txtFieldFirstName.layer.cornerRadius = 10
        txtFieldLastName.layer.cornerRadius = 10
        txtFieldPassword.layer.cornerRadius = 10
        txtFieldMobileNo.layer.cornerRadius = 10
        txtFieldEmailSignIn.layer.cornerRadius = 10
        txtFieldEmailSignUp.layer.cornerRadius = 10
        txtFieldPasswordSignIn.layer.cornerRadius = 10
        btnSignUp.layer.cornerRadius = 10
        btnSignIn.layer.cornerRadius = 10
        viewBackground.layer.cornerRadius = 10
        viewMobile.layer.cornerRadius = 10
        
        txtFieldFirstName.setLeftPaddingPoints(10)
        txtFieldLastName.setLeftPaddingPoints(10)
        txtFieldPassword.setLeftPaddingPoints(10)
        txtFieldMobileNo.setLeftPaddingPoints(10)
        txtFieldEmailSignIn.setLeftPaddingPoints(10)
        txtFieldEmailSignUp.setLeftPaddingPoints(10)
        txtFieldPasswordSignIn.setLeftPaddingPoints(10)
        
        txtFieldFirstName.layer.borderWidth = 1.0
        txtFieldFirstName.layer.borderColor = Constant.color.borderColor
        txtFieldLastName.layer.borderWidth = 1.0
        txtFieldLastName.layer.borderColor = Constant.color.borderColor
        txtFieldPassword.layer.borderWidth = 1.0
        txtFieldPassword.layer.borderColor = Constant.color.borderColor
        txtFieldEmailSignIn.layer.borderWidth = 1.0
        txtFieldEmailSignIn.layer.borderColor = Constant.color.borderColor
        txtFieldEmailSignUp.layer.borderWidth = 1.0
        txtFieldEmailSignUp.layer.borderColor = Constant.color.borderColor
        txtFieldPasswordSignIn.layer.borderWidth = 1.0
        txtFieldPasswordSignIn.layer.borderColor = Constant.color.borderColor
        viewMobile.layer.borderWidth = 1.0
        viewMobile.layer.borderColor = Constant.color.borderColor
        viewBackground.layer.borderWidth = 1.0
        viewBackground.layer.borderColor = Constant.color.borderColor
        viewBackground.layer.shadowOpacity = 1
        viewBackground.layer.shadowOffset = .zero
        viewBackground.layer.shadowRadius = 5
    }
    
    func signUpAPI() {
        self.view.showLoadingIndicator()
        reqUser.firstName = txtFieldFirstName.text ?? ""
        reqUser.lastName = txtFieldLastName.text ?? ""
        reqUser.email = txtFieldEmailSignUp.text ?? ""
        reqUser.phone = txtFieldMobileNo.text ?? ""
        reqUser.deviceType = Constant.UserDeviceConstant.DeviceType
        reqUser.fcmToken = Constant.UserDeviceConstant.DeviceToken
        reqUser.password = txtFieldPassword.text ?? ""
        reqUser.countryCode = code
        reqUser.signUpType = "email"
        reqUser.signUp { [self] loginUser, errMsg, errCode in
            self.view.hideLoadingIndicator()
            if errCode == 200 {
                self.showAlertMsg(errMsg)
            } else {
                self.showAlertMsg(errMsg)
            }
        }
    }
    
    func signInAPI(){
        self.view.showLoadingIndicator()
        reqUser.email = txtFieldEmailSignIn.text ?? ""
        reqUser.deviceType = Constant.UserDeviceConstant.DeviceType
        reqUser.fcmToken = Constant.UserDeviceConstant.DeviceToken
        reqUser.password = txtFieldPasswordSignIn.text ?? ""
        reqUser.signIn {loginUser, errMsg, errCode in
            self.view.hideLoadingIndicator()
            if errCode == 200 {
                self.showAlertMsg(errMsg)
            } else {
                self.showAlertMsg(errMsg)
            }
        }
    }
}
    
    // MARK: - IBActions
extension SignInSignUpViewController{
    
    @IBAction func onBtnSignUpClicked(_ sender: UIButton) {
        signUpAPI()
    }
    
    @IBAction func onBtnSignInClicked(_ sender: UIButton) {
        signInAPI()
        /*
         let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
         let targetVC = sb.instantiateViewController(withIdentifier: "PersonalInfoViewController")
         self.navigationController?.pushViewController(targetVC, animated: true)
         */
    }
   
    @IBAction func onBtnSignInSignUpOptionClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            self.viewSignIn.isHidden = true
            self.viewSignInHeader.isHidden = true
            self.viewSignUp.isHidden = false
            self.viewSignUpHeader.isHidden = false
            imgTopBackground.image = UIImage(named: "signUpBackground")
            self.btnSignInHeader.setTitleColor(UIColor(red:200/255, green:199/255, blue:204/255, alpha: 1), for: .normal)
            self.btnSignUpHeader.setTitleColor(UIColor(red:38/255, green:38/255, blue:40/255, alpha: 1), for: .normal)
        }else {
            self.viewSignIn.isHidden = false
            self.viewSignInHeader.isHidden = false
            self.viewSignUp.isHidden = true
            self.viewSignUpHeader.isHidden = true
            imgTopBackground.image = UIImage(named: "loginBackground")
            self.btnSignUpHeader.setTitleColor(UIColor(red:200/255, green:199/255, blue:204/255, alpha: 1), for: .normal)
            self.btnSignInHeader.setTitleColor(UIColor(red:38/255, green:38/255, blue:40/255, alpha: 1), for: .normal)
        }
    }
}

extension SignInSignUpViewController : CountryPickerListDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        debugPrint("Selected country \(country)")
        code  =  country.code
    }
    
    func showCountryList(output: CountryPickerListOutput) {
        let countryList = CountryPickerList(style: .insetGrouped)
        countryList.output = output
        self.navigationController?.present(countryList, animated: true)
    }
    
    
}

