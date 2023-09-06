//
//  MessageVC.swift
//  
//
//  Created by Caksu Sethi on 19/08/23.
//

import UIKit

class MessageVC: UIViewController {
    @IBOutlet weak var tblVw:UITableView!
    @IBOutlet weak var viewSearch:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        viewSearch.layer.cornerRadius = 10
    }
    
    func registerNib() {
        tblVw.register(UserHomeCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tab
extension MessageVC : TBLDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserHomeCell = tblVw.deque(UserHomeCell.self, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "ChatVC")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
