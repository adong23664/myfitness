//
//  TricepsDetailVC.swift
//  myFitness
//
//  Created by 楊振東 on 2021/7/7.
//

import UIKit
import WebKit
import FirebaseUI

class TricepsDetailVC: UIViewController, WKNavigationDelegate {
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var tricepsWebView: WKWebView!
    @IBOutlet weak var tricepsstepLabel: UILabel!
    @IBOutlet weak var tricepsMainImage: UIImageView!
    var triceps = PartMuscle()

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideo(videoCode:"\(triceps.video)" )
        let str = triceps.step
        let newStr = str.replace(target:"_b",withString: "\n")
        tricepsstepLabel.text = newStr
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("triceps/\(triceps.image).jpeg")
        tricepsMainImage.sd_setImage(with: ref)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white

        
    }
    func getVideo(videoCode: String) {
        DispatchQueue.global().async {
            let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
            DispatchQueue.main.async {
                self.tricepsWebView.load(URLRequest(url: url!))
                self.tricepsWebView.addSubview(self.spinner)
                self.spinner.startAnimating()
                self.tricepsWebView.navigationDelegate = self
                self.spinner.hidesWhenStopped = true
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
    }

}
