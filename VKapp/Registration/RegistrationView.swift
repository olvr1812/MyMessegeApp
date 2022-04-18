//
//  ViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 17.01.2022.
//

import UIKit
import WebKit


class RegisteretionView: UIViewController {
    

    @IBOutlet weak var webview: WKWebView! {

    didSet{ webview.navigationDelegate = self }
        
    }
    
    let session = Session.session
    
    private var urlComponents: URLComponents = {
        var auth = URLComponents()
        auth.scheme = "https"
        auth.host = "oauth.vk.com"
        auth.path = "/authorize"
        auth.queryItems = [
        URLQueryItem(name: "client_id", value: "8085963"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "60"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "v", value: "5.68")
        ]
        return auth
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = urlComponents.url else { return }
        
        webview.load(URLRequest(url: url))
    }

}

extension RegisteretionView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map({ $0.components(separatedBy: "=")})
            .reduce([String: String]()) {result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userIDstr = params["user_id"],
              let userID = Int(userIDstr) else {
                  decisionHandler(.allow)
                  return }
        
        session.token = token
        session.userId = userID
        
        
        print("User ID: \(session.userId)\nToken: \(session.token)")
        
        performSegue(withIdentifier: "showTabBar", sender: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarID")
//        present(vc, animated: true)

        decisionHandler(.cancel)
    }
}


