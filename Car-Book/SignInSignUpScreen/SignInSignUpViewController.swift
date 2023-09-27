//
//  SignInSignUpViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit
import CountryPickerIOS
import IQKeyboardManagerSwift
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
import AuthenticationServices
import GoogleSignIn

import KeychainSwift

class SignInSignUpViewController: BaseClassVC,ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding  {


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
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet var btnCountryCode: UIButton!

   // MARK: - Properties
    var countryPickerView: CountryPickerView?
    var code = "+234"

    // MARK: - properties
    var socialId = ""
    var socialFullname = ""
    var socialEmail = ""
    var isfromGoogle = 0
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
      if UserStoreSingleton.shared.isLoggedIn == false {
        self.btnBack.isHidden = false
      }else{
        self.btnBack.isHidden = true
      }
      self.tabBarController?.tabBar.isHidden = true
      navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setupUI()
       // setCountryTxtField()
    }
    
    // MARK: - ViewWillAPPear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Methods
  func setCountryTxtField() {
    countryPickerView = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 100, height: txtFieldMobileNo.bounds.height))
    countryPickerView?.delegate = self
    countryPickerView?.setCountryByPhoneCode("+234")
    txtFieldMobileNo.leftView = countryPickerView
    txtFieldMobileNo.leftViewMode = .always
  }
    
    func setupUI() {
      txtFieldMobileNo.delegate = self
//      if Global.objGlobalMethod.getSetCountryCode() {
//         // setSelectedCountry()
//      }
//      else {
//         // self.showAlert(Alert.alertTitle, Alert.countryCodeNotFound, Alert.buttonOK)
//      }

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
        //viewBackground.layer.borderWidth = 0.5
     // viewBackground.layer.borderColor = UIColor.lightGray.cgColor()//Constant.color.borderColor
      //  viewBackground.layer.shadowOpacity = 0.5
       // viewBackground.layer.shadowOffset = .zero
       // viewBackground.layer.shadowRadius = 1
    }
    
    func signUpAPI() {
      if Helper.shared.isFieldEmpty(field: txtFieldFirstName.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterFirstName)
          return
      }
      if Helper.shared.isFieldEmpty(field: txtFieldLastName.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterLastName)
          return
      }
      if Helper.shared.isFieldEmpty(field: txtFieldEmailSignUp.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterEmail)
          return
      }
      if Helper.shared.isValidEmail(candidate: txtFieldEmailSignUp.text ?? ""){
          DisplayBanner.show(message: ErrorMessages.alertValidEmail)
          return
      }
      if Helper.shared.isFieldEmpty(field: txtFieldPassword.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterPassword)
          return
      }

      if Helper.shared.isFieldEmpty(field: txtFieldMobileNo.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterMobile)
          return
      }

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
        reqUser.role = "user"
        reqUser.signUp { [self] loginUser, errMsg, errCode in
            DispatchQueue.main.async {
                self.view.hideLoadingIndicator()
                if errCode == 200 {
                  UserDefaults.standard.set(self.txtFieldFirstName.text ?? "", forKey: "username")
                  UserDefaults.standard.set(self.txtFieldEmailSignUp.text ?? "", forKey: "email")
                    self.showAlertMsgAction(errMsg) {
                      let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                      UserStoreSingleton.shared.isLoggedIn = true
                      UserStoreSingleton.shared.userType = "user"
                      let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
                      self.navigationController?.pushViewController(targetVC, animated: true)
                    }
                } else {
                    self.showAlertMsg(errMsg)
                }
            }
        }
    }
    
    func signInAPI(){

      if Helper.shared.isFieldEmpty(field: txtFieldEmailSignIn.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterEmail)
          return
      }
      if Helper.shared.isValidEmailAddress(candidate: txtFieldEmailSignIn.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertValidEmail)
          return
      }
      if Helper.shared.isFieldEmpty(field: txtFieldPasswordSignIn.text ?? "") {
          DisplayBanner.show(message: ErrorMessages.alertEnterPassword)
          return
      }

        self.view.showLoadingIndicator()
        reqUser.email = txtFieldEmailSignIn.text ?? ""
        reqUser.deviceType = Constant.UserDeviceConstant.DeviceType
        reqUser.fcmToken = Constant.UserDeviceConstant.DeviceToken
        reqUser.password = txtFieldPasswordSignIn.text ?? ""
        reqUser.signIn {loginUser, errMsg, errCode in
            DispatchQueue.main.async {
                self.view.hideLoadingIndicator()
                
                if errCode == 200 {
                    self.showAlertMsgAction(errMsg) {
                      UserStoreSingleton.shared.userType = loginUser?.data?.role
                      if loginUser?.data?.role == "owner" {
                        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                        UserStoreSingleton.shared.isLoggedIn = true
                        let targetVC : GuestTab = Constant.AppStoryBoard.Guest.instance.instantiateViewController()
                        //sb.instantiateViewController(withIdentifier: "GuestTab")
                        self.navigationController?.pushViewController(targetVC, animated: true)
                      } else {
                        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                        UserStoreSingleton.shared.isLoggedIn = true
                        let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
                        self.navigationController?.pushViewController(targetVC, animated: true)
                      }
                     // UserDefaults.standard.set(self.txtFieldEmailSignIn.text, forKey: "email")
                    //  UserDefaults.standard.set(loginUser?.data?.firstName, forKey: "username")

                    }
                } else {
                    self.showAlertMsg(errMsg)
                }
            }
        }
    }

//  func setSelectedCountry() {
//      let flag = UserDefaults.standard.string(forKey: selectedCountryFlag)
//      let countryCode = UserDefaults.standard.string(forKey: selectedCountryCode) ?? ""
//      self.btnCountryCode.setTitle("\(countryCode)", for: .normal)
//  }

  func showAlert(_ title: String, _ message:String,_ buttonTitle:String){
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: buttonTitle, style: .default) { (action: UIAlertAction) in

      }
      alert.addAction(action)
      present(alert, animated: true, completion: nil)
  }
}
    
    // MARK: - IBActions
extension SignInSignUpViewController{
  @IBAction func onBtnFlagClicked(_ sender: UIButton) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "CountryVC") as! CountryVC
    vc.objDelegate = self
    vc.modalPresentationStyle = .overFullScreen
    self.navigationController?.present(vc, animated: true, completion: nil)
  }

  @IBAction func onBtnBackClicked(_ sender: UIButton) {
    self.tabBarController?.tabBar.isHidden = false
    self.navigationController?.popViewController(animated: true)
  }

    @IBAction func onBtnSignUpClicked(_ sender: UIButton) {
        signUpAPI()
    }
    
    @IBAction func onBtnSignInClicked(_ sender: UIButton) {
        signInAPI()
       }

  @IBAction func googleClicked(_ sender: UIButton) {

    let signInConfig = GIDConfiguration(clientID: "958664200343-dhsg9fs9hhosadpjk37ags6rrdvvctb1.apps.googleusercontent.com")
      GIDSignIn.sharedInstance.signIn(withPresenting: self) { user,error in

        guard error == nil else { return }
        guard let user = user else { return }

        let userId          = user.user.userID
        self.socialId       = userId ?? ""
        print("Userid: \(String(describing: userId!))")
        let fullName        = user.user.profile?.name ?? ""
        self.socialFullname = fullName
        print("fullname:\(String(describing: fullName))")
        let email1          = user.user.profile?.email ?? " "
        self.socialEmail    = email1
        print("email:\(String(describing: email1))")
        self.isfromGoogle = 1
        UserDefaults.standard.set(fullName, forKey: "username")
        UserDefaults.standard.set(email1, forKey: "email")
        self.dismiss(animated: true)
       // self.showAlertMsg("Social login")

        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
        UserStoreSingleton.shared.isLoggedIn = true
        self.navigationController?.pushViewController(targetVC, animated: true)

     //   self.signupApi()
    }
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
  
  @IBAction func onBtnFBClicked(_ sender: UIButton) {
    loginWithFacebook()
  }

  @IBAction func onBtnAppleClicked(_ sender: UIButton) {
    if #available(iOS 13.0, *)  {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: KeychainSwift().get("ContractUs") ?? "") {
            (credentialState, error) in
            switch credentialState {
            case .authorized:
                let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                                ASAuthorizationPasswordProvider().createRequest()]
                let authorizationController = ASAuthorizationController(authorizationRequests: requests)
                authorizationController.delegate = self
                authorizationController.presentationContextProvider = self
                authorizationController.performRequests()
                break
            case .revoked:
                break
            case .notFound:
                let request = appleIDProvider.createRequest()
                request.requestedScopes = [.fullName, .email ]
                let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                authorizationController.delegate = self
                authorizationController.performRequests()
            default:
                break
            }
        }
    } else {
        let alert = UIAlertController(title: "Contract Us" , message: "Comming Soon", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
  }

  func socialLogin(_ request: SocialLoginRequest) {

  }

  func loginWithFacebook(){
      let loginManager = LoginManager()
      loginManager.logIn(permissions: [ .publicProfile,.email ], viewController: self) { loginResult in
          switch loginResult {
          case .failed(let error):
              print(error)
          case .cancelled:
              print("User cancelled login.")
          case .success(_, _, _):
              let graphReq : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "picture.width(512).height(512), name, email, first_name, last_name"])
              graphReq.start(completionHandler: {[self] (connection, userInfo, error) in
                  if(userInfo != nil){
                      print(userInfo)
                      //save user id and make entry in database
                      let result      = userInfo as! NSDictionary
                      let username    = "\(result.object(     forKey: "first_name") ?? "")" + " " + "\(result.object(forKey: "last_name") ?? "")"

                      loginManager.logOut()
                      self.socialFullname = username
                      self.socialId = result.object(forKey: "id") as? String ?? ""
                      self.socialEmail =  result.object(forKey: "email") as? String ?? ""
                      UserDefaults.standard.set(socialFullname,forKey: "username")
                      UserDefaults.standard.set(socialEmail, forKey: "email")
                      self.isfromGoogle = 1
                     let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
                     let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
                     UserStoreSingleton.shared.isLoggedIn = true
                     self.navigationController?.pushViewController(targetVC, animated: true)
                   //   self.signupApi()
                  } else{
                  }
              })
          }
      }
  }
  // MARK: - Social Login Functions ***********************************************
  @available(iOS 13.0, *)
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
      return self.view.window!
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

// MARK: - TextFieldDelegate
extension SignInSignUpViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = txtFieldMobileNo.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 12
    }
}


//MARK: Country Selection Extension
extension SignInSignUpViewController:  countryProtocol {
    func getCountry(data: CountryModel) {
       // UserDefaults.standard.set("\(data.callingCode)", forKey: selectedCountryCode)
       // UserDefaults.standard.set(data.countryFlag, forKey: selectedCountryFlag)
       // setSelectedCountry()
    }
//  func ClearLoginData() {
//      UserDefaults.standard.set(nil, forKey: user_LoginData)
//      UserDefaults.standard.set(false, forKey: isLoggedIn)
//      UserDefaults.standard.set(nil, forKey: selectedCountryCode)
//      UserDefaults.standard.set(nil, forKey: currentAddress)
//  }
    func archiveCountryModel(countryData : CountryModel) -> Data {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: countryData, requiringSecureCoding: false)
            return data
        } catch {
            fatalError("Can't encode data: \(error)")
        }
    }
}
