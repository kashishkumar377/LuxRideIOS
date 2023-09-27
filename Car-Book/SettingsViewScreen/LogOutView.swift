//
//  LogOutView.swift
//  Music Monster
//
//  Created by Guru Dev on 25/02/23.
//

import UIKit


class LogOutView: UIView {

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var bgVw: UIView!

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!

    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var logOutBtn: UIButton!



  var btnCallBack : (() -> Void)?
//    var viewModel = ProfileVM()
//    var requsetModel = EditProfileRequest()
//     var connectedService = [StreamService]()


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
        Bundle.main.loadNibNamed("LogOutView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }


    @IBAction func logOutTapped(_ sender: UIButton) {
      guard let call = btnCallBack else {
        return
      }
      self.removeFromSuperview()
      call()
      //self.navigationController?.pushViewController(targetVC, animated: true)

//      let delegate = UIApplication.shared.delegate as? AppDelegate
//      let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
//      let targetVC = sb.instantiateViewController(withIdentifier: "GetStartedViewController")
//      let nav = UINavigationController(rootViewController: targetVC)
//      delegate?.window?.rootViewController = nav
//      delegate?.window?.makeKeyAndVisible()

    }

    @IBAction func cancelTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }

}
