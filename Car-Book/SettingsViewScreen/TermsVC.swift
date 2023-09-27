//
//  TermsVC.swift
//  Gifts
//
//  Created by Apple on 10/06/22.
//

import UIKit
import WebKit

class TermsVC: BaseClassVC,UIWebViewDelegate,WKNavigationDelegate {
    
    //MARK: - IBActions
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet var loader: UIActivityIndicatorView!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    //MARK: - Variable
    var screenCheck = ""
    var terms : String?
    var policy : String?
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      let url = URL(string: terms ?? "https://www.google.com")
      webview.load(URLRequest(url: url!))

        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "loading" {
            if webview.isLoading {
               // loader.startAnimating()
               // loader.isHidden = false
            } else {
                loader.stopAnimating()
            }
        }
    }
    
    
    
    //MARK: - IBActions
    
    @IBAction func action_back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Custom Methods
    func loadHTMLStringImage(string: String?)  {
        
    }
    
   
}

