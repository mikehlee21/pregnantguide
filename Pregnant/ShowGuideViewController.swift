//
//  ShowGuideViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ShowGuideViewController: UIViewController {

    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    var selectedIndex :Int = 0
    var navStr = String("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navItem.title = navStr
        
        if(selectedIndex != 6) {
            let bundlePath = Bundle.main.bundlePath
            let code = Language.getCurrentLanguage()
            let htmlFile = "\(bundlePath)/assets/" + String(selectedIndex) + "_" + code + ".html"
            
            let fileURL = NSURL(fileURLWithPath: htmlFile)
            webView.loadRequest(NSURLRequest(url: fileURL as URL) as URLRequest)
        }
        else {
            
            let path = Bundle.main.path(forResource: "vidx", ofType:"mp4")
            let url = NSURL.fileURL(withPath: path!)
            print(url)
            let player = AVPlayer(url: url)
            let playerController = AVPlayerViewController()
            
            playerController.player = player
            self.addChildViewController(playerController)
            self.view.addSubview(playerController.view)
            playerController.view.frame = self.view.frame
            
            player.play()
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        
        //        let url = Bundle.main.url(forResource: "1_en", withExtension: "html")
//        
//        let request = NSURLRequest(url: url!)
//        webView.loadRequest(request as URLRequest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
