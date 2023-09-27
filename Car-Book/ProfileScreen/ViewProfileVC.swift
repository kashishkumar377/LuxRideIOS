//
//  ViewProfileVC.swift
//  Car-Book
//
//  Created by Devgan on 12/09/23.
//

import UIKit
import SDWebImage

class ViewProfileVC: BaseClassVC,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  //MARK: - IBOUTLET
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var userImg: UIImageView!

  @IBOutlet weak var userJoinDate: UILabel!

  @IBOutlet weak var lblFbVerified: UILabel!
  @IBOutlet weak var lblPhone: UILabel!
  @IBOutlet weak var lblEmail: UILabel!
   @IBOutlet weak var lblPhoneVerified: UILabel!
  @IBOutlet weak var lblDescrption: UILabel!
  @IBOutlet weak var lblLanguage: UILabel!
  @IBOutlet weak var lblNIN: UILabel!
  @IBOutlet weak var viewBg: DesignableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.getProfile()
    viewBg.layer.borderWidth = 0.2
    viewBg.layer.borderColor = Constant.color.borderColor
    viewBg.layer.cornerRadius = 10
  }

  override func viewWillAppear(_ animated: Bool) {
    self.getProfile()
  }
  @IBAction func btnBack(_ sender:UIButton) {
    self.navigationController?.popViewController(animated: true)
  }

  @IBAction func btnImageUpload(_ sender:UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
        userImg.image = image
      self.GetImg()
    }
  }

  @IBAction func btnEdit(_ sender:UIButton) {

    let targetVC :  EditProfileVC = Constant.AppStoryBoard.Main.instance.instantiateViewController()
    self.navigationController?.pushViewController(targetVC, animated: true)
  }

}

//MARK: - API CALL
extension ViewProfileVC {

  // MARK: - Methods
  func getProfile(){
    reqUser.getProfileAPi { user, res, errCode in
      DispatchQueue.main.async {
        self.userName.text = "\(user?.firstName ?? "") \(user?.lastName ?? "")"
        self.lblEmail.text = user?.email
        self.lblPhone.text = "\(user?.countryCode ?? "") \(user?.phone ?? "")"
        self.lblNIN.text = user?.ninNumber ?? "(Please Update)"
        self.lblLanguage.text = user?.language ?? "(Please Update)"
        self.lblDescrption.text = user?.description
        let imgUrl = "\(APiConstants.imageUrl)\(user?.profileImg ?? "")"
        self.userImg.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.userImg.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "profile-user"))
            //self.GetImg()
        if user?.isEmailVerified == 0  {
          self.lblPhoneVerified.text = "Verify"
        }else if user?.isPhoneVerified == 0{
          self.lblPhoneVerified.text = "Verify"

        }else{
          self.lblFbVerified.text = "Not Connected"
        }

      }
    }
  }

  func GetImg() {
      reqUser.uploadImg((userImg.image?.jpegData(compressionQuality: 0.1))!) { errMsg, errCode in
        self.getProfile()
      }
  }
}

//pod 'GooglePlaces', '8.2.1'
