//
//  AccountViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class AccountViewController: BaseClassVC {

  @IBOutlet weak var LblMobile: UILabel!
  @IBOutlet weak var LblEmail: UILabel!
  @IBOutlet var tblAccount: UITableView!

    var arrHeader = ["Email","Password", "Mobile Number"]
    var arrDetails = ["test@gmail.com","**************", "456546546"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tabBarController?.tabBar.isHidden = true
      LblEmail.text = UserStoreSingleton.shared.phoneNumer
      self.getProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

  // MARK: - Methods
  func getProfile(){
    reqUser.getProfileAPi { user, res, errCode in
      DispatchQueue.main.async {

       // self.LblEmail.text = user?.email
        self.LblMobile.text = "\(user?.countryCode ?? "") \(user?.phone ?? "")"

      }
    }
  }
    
  @IBAction func actionPassword(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "ChangePasswordViewController")
    targetVC.modalPresentationStyle = .fullScreen
    self.present(targetVC, animated: true, completion: nil)
  }

  @IBAction func actionEmail(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    
    let targetVC = sb.instantiateViewController(withIdentifier: "ChangeEmailViewController") as! ChangeEmailViewController
  targetVC.modalPresentationStyle = .overCurrentContext
     //add clear color background
  targetVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    self.present(targetVC, animated: true, completion: nil)
  }

  @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
  }
