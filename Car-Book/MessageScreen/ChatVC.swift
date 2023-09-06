//
//  ChatVC.swift
//  
//
//  Created by Caksu Sethi on 21/08/23.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var tblVw:UITableView!
    @IBOutlet weak var viewMsgSend:UIView!
    @IBOutlet weak var btnSend:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewMsgSend.layer.cornerRadius = 10
        btnSend.layer.cornerRadius = 10
        registerNib()
    }
    
    func registerNib() {
        tblVw.register(SenderTableViewCell.self)
        tblVw.register(ReciverTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tab
extension ChatVC : TBLDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row * 2) == 0 {
            let cell : SenderTableViewCell = tblVw.deque(SenderTableViewCell.self, at: indexPath)
            return cell
        } else {
            let cell : ReciverTableViewCell = tblVw.deque(ReciverTableViewCell.self, at: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
