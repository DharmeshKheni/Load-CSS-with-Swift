//
//  ViewController.swift
//  testing
//
//  Created by Anil on 04/04/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var urlPath = "http://grappul.com"
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadAddress()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAddress(){
        let requestURL = NSURL(string:urlPath)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        println("got the page!")
        webViewDidFinishLoad(webView)
    }
    
    func webViewDidFinishLoad(website: UIWebView){
        var jsscript = "var script = document.createElement('link');script.type = 'text/css';script.rel = 'stylesheet';script.href = 'http://www.grappul.com/snapkin/restyle.css';document.getElementByTagName('head')[0].appendChild(script);"
    
        println("got the css!")
        website.stringByEvaluatingJavaScriptFromString(jsscript)
}
}