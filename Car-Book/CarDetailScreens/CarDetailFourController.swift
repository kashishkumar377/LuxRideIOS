//
//  CarDetailFourController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailFourController: BaseClassVC,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var viewDesc: UIView!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var img_car1: UIImageView!
    @IBOutlet var img_car2: UIImageView!
    @IBOutlet var img_car3: UIImageView!
    @IBOutlet var img_car4: UIImageView!
    @IBOutlet var img_car5: UIImageView!
    @IBOutlet var img_car6: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewDesc.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
        img_car1.layer.cornerRadius = 10
        img_car2.layer.cornerRadius = 10
        img_car3.layer.cornerRadius = 10
        img_car4.layer.cornerRadius = 10
        img_car5.layer.cornerRadius = 10
       
        viewDesc.layer.borderWidth = 1.0
        viewDesc.layer.borderColor =  Constant.color.borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
  @IBAction func onSubmit(_ sender: UIButton) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
    self.navigationController?.pushViewController(targetVC, animated: true)
  }

  @IBAction func onFirstImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car1.image = image

    }
  }
  @IBAction func onSecondImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car2.image = image

    }
  }
  @IBAction func onThirdImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car3.image = image

    }
  }

  @IBAction func onFourImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car4.image = image
    }
  }
  @IBAction func onFiveImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car5.image = image

    }
  }
  @IBAction func onSixImg(_ sender: UIButton) {
    ImagePickerManager().pickImage(self){ [self] image,path  in
        print(path)
      img_car6.image = image

    }
  }

}
