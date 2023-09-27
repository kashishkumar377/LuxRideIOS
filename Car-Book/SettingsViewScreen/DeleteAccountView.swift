//
//  DeleteAccountView.swift
//  Music Monster
//
//  Created by Devgan on 09/08/23.
//

import Foundation
import UIKit

class DeleteAccountView: UIView {
    
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var bgVw: UIView!

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var NoBtn: UIButton!
    @IBOutlet weak var YesBtn: UIButton!
    
 //   var viewModel = ProfileVM()
 //   var requsetModel = EditProfileRequest()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit()
    {
        Bundle.main.loadNibNamed("DeleteAccountView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    @IBAction func YesTapped(_ sender: UIButton) {
//        self.viewModel.getDeleteApi(appDelegateObj.userDataDictionary["uid"] as? String ?? "0") { (success, errMsg) in
//            
//            UserDefaults.resetDefaults()
//            guard let vc = StoryBoard.main.value.instantiateViewController(withIdentifier: ViewControllerIds.welcome) as? WelcomeVC else {
//                return
//            }
//            let nav = UINavigationController(rootViewController: vc)
//            sceneDelegateObj.window?.rootViewController = nav
//            sceneDelegateObj.window?.makeKeyAndVisible()
//        }
        
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
}
