//
//  ProfileViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit
import SDWebImage

class ProfileViewController: BaseClassVC {

    // MARK: - IBoutlets
    @IBOutlet var viewData: UIView!
    @IBOutlet var btnTrip: UIButton!
    @IBOutlet var btnBecomeHost: UIButton!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet var btnVwEdit: UIButton!
    @IBOutlet var imgVw:UIImageView!
    
  @IBOutlet weak var logoutStackHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var btnSwitchMode: UIButton!
    @IBOutlet weak var lblLogSignIn: UILabel!
    @IBOutlet weak var btnSwitchAccountHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var deleteVw: UIView!
    @IBOutlet weak var logoutVw: UIView!
    @IBOutlet weak var accountVwHeight: NSLayoutConstraint!

  // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
      viewData.layer.cornerRadius = 10
      btnBecomeHost.isHidden = false
      self.btnSwitchAccountHeightConstraint.constant = 0
    }

    override func viewWillAppear(_ animated: Bool) {

      if UserStoreSingleton.shared.isLoggedIn ?? false {
        self.accountVwHeight.constant = 30
        self.logoutVw.isHidden = false
        self.deleteVw.isHidden = false
        lblLogSignIn.text = "View or Edit Profile"
        self.getProfile()
      }else{
        self.accountVwHeight.constant = 0
        self.logoutVw.isHidden = true
        self.deleteVw.isHidden = true
        self.logoutStackHeightConstraint.constant = 70
        self.lblName.text = "Welcome to Luxe Ride"
        lblLogSignIn.text = "Log in or Sign up"
        self.btnSwitchAccountHeightConstraint.constant = 0
      }
    }
    

  @IBAction func logoutAction(_ sender: Any) {

    let vwLogOut = LogOutView(frame: self.view.frame)
    vwLogOut.btnCallBack = {
      UserStoreSingleton.shared.isLoggedIn = false
      let targetVC : GetStartedViewController = Constant.AppStoryBoard.Main.instance.instantiateViewController()
      targetVC.hidesBottomBarWhenPushed = true
      UserStoreSingleton.shared.userType = ""
      UserDefaults.standard.removeObject(forKey: "email")
      UserDefaults.standard.removeObject(forKey: "username")
      self.navigationController?.pushViewController(targetVC, animated: true)
   }
    self.view.addSubview(vwLogOut)
  }

  @objc func tempLogOut() {
   // UserDefaults.resetDefaults()
    let delegate = UIApplication.shared.delegate as? AppDelegate
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "GetStartedViewController")
    let nav = UINavigationController(rootViewController: targetVC)
    delegate?.window?.rootViewController = nav
    delegate?.window?.makeKeyAndVisible()
  }

}

    // MARK: - IBActions
extension ProfileViewController {

    @IBAction func onBtnSettingsClicked(_ sender: UIButton) {
        let targetVC :  SettingsViewController = Constant.AppStoryBoard.Main.instance.instantiateViewController()
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

  @IBAction func onBtnSupportClicked(_ sender: UIButton) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "ContactSupportViewController")
    self.navigationController?.pushViewController(targetVC, animated: true)
  }
  
    @IBAction func onBtnNotificationClicked(_ sender: UIButton) {
      let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
      let targetVC = sb.instantiateViewController(withIdentifier: "AccountViewController")

      self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func onBtnBecomeHostClicked(_ sender: UIButton) {

      let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
      let targetVC = sb.instantiateViewController(withIdentifier: "CarAddressVC") 
      self.navigationController?.pushViewController(targetVC, animated: true)
    }

  @IBAction func onBtnSwitchClicked(_ sender: UIButton) {
   if UserStoreSingleton.shared.userType == "owner" {
      self.updateProfile()
    }else{
      self.updateProfile()
    }
  }

    @IBAction func btnVwProfile(_ sender:UIButton) {
      if UserStoreSingleton.shared.isLoggedIn == false {
        let targetVC :  SignInSignUpViewController  = Constant.AppStoryBoard.Main.instance.instantiateViewController()
        self.navigationController?.pushViewController(targetVC, animated: true)
      }else{

        let targetVC :  ViewProfileVC  = Constant.AppStoryBoard.Main.instance.instantiateViewController()
        self.navigationController?.pushViewController(targetVC, animated: true)
      }

    }
}

extension ProfileViewController {

  func updateProfile() {
   if UserStoreSingleton.shared.userType == "owner" {
      self.view.showLoadingIndicator()
      reqUser.role = "user"

      reqUser.updateProfile { [self] loginUser, errMsg, errCode in
          DispatchQueue.main.async {
              self.view.hideLoadingIndicator()
              if errCode == 200 {
                let targetVC : TabBarViewController = Constant.AppStoryBoard.Main.instance.instantiateViewController()
                targetVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(targetVC, animated: true)
                } else {
                  self.showAlertMsg(errMsg)
              }
          }
      }
    }else{
      self.view.showLoadingIndicator()
      reqUser.role = "owner"

      reqUser.updateProfile { [self] loginUser, errMsg, errCode in
          DispatchQueue.main.async {
              self.view.hideLoadingIndicator()
              if errCode == 200 {
                let sb = UIStoryboard(name: Constant.AppStoryBoard.Guest.rawValue, bundle: nil)
                self.tabBarController?.tabBar.isHidden = true
                UserStoreSingleton.shared.userType = loginUser?.role
                let targetVC = sb.instantiateViewController(withIdentifier: "GuestTab") as? GuestTab
                self.navigationController?.pushViewController(targetVC!, animated: true)
              } else {
                  self.showAlertMsg(errMsg)
              }
          }
      }
    }


  }


// MARK: - Methods
func getProfile(){
    reqUser.getProfileAPi { user, res, errCode in

      DispatchQueue.main.async {
        UserStoreSingleton.shared.userToken = user?.token

        if user?.role == "owner" {
          self.btnSwitchMode.setTitle("SWITCH MODE TO GUEST", for: .normal)
          self.btnSwitchAccountHeightConstraint.constant = 45
          self.lblName.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
          self.imgVw.sd_imageIndicator = SDWebImageActivityIndicator.gray
          let imgUrl = "\(APiConstants.imageUrl)\(user?.profileImg ?? "")"
          self.imgVw.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "profile-user"))
          UserStoreSingleton.shared.userType = user?.role
        }else if user?.role  == "user"{
          self.btnSwitchMode.setTitle("SWITCH MODE TO HOST", for: .normal)
          self.btnSwitchAccountHeightConstraint.constant = 45
          self.lblName.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
          self.imgVw.sd_imageIndicator = SDWebImageActivityIndicator.gray
          let imgUrl = "\(APiConstants.imageUrl)\(user?.profileImg ?? "")"
          self.imgVw.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "profile-user"))
          UserStoreSingleton.shared.userType = user?.role
          UserStoreSingleton.shared.phoneNumer = "\(user?.countryCode ?? "") \(user?.phone ?? "")"
        }else{
          self.btnSwitchAccountHeightConstraint.constant = 0
        }

      }

    }
}

func GetImg() {
    reqUser.uploadImg((imgVw.image?.jpegData(compressionQuality: 0.1))!) { errMsg, errCode in

    }
}


}
