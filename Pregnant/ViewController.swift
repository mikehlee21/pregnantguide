//
//  ViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let notificationName2 = Notification.Name("Did selected language")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var guideViewController = GuideNavigationController()
    var bmiController = BMIViewController()
    var fetalController = FETALViewController()
    var deliveryController = DELIVERYViewController()
    var ageController = AGEViewController()
    
    var pivotPageController = MIPivotPageController()
    
    @IBAction func onLaEnglish(_ sender: Any) {
        
        let langCode = Language.getLanguageCode("English")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }

    @IBAction func onLaIndo(_ sender: Any) {
        let langCode = Language.getLanguageCode("Indonesian")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }
    
    @IBAction func onLaHi(_ sender: Any) {
        let langCode = Language.getLanguageCode("हिंदी")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }
    
    @IBAction func onLaAr(_ sender: Any) {
        let langCode = Language.getLanguageCode("العربية")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }
    
    @IBAction func onLaRu(_ sender: Any) {
        let langCode = Language.getLanguageCode("русский")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }
    @IBAction func onLaCh(_ sender: Any) {
        let langCode = Language.getLanguageCode("中文")
        Language.setLanguage(langCode)
        
        // Post notification
        NotificationCenter.default.post(name: self.notificationName2, object: nil)
        
        createPivotPageController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPivotPageController() {
        let myBlueColor = UIColor(red: 255/255.0, green: 80/255.0, blue: 140/255.0, alpha: 1)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guideViewController = mainStoryboard.instantiateViewController(withIdentifier: "Guide") as! GuideNavigationController
        bmiController = mainStoryboard.instantiateViewController(withIdentifier: "BMI") as! BMIViewController
        fetalController = mainStoryboard.instantiateViewController(withIdentifier: "FETAL") as! FETALViewController
        deliveryController = mainStoryboard.instantiateViewController(withIdentifier: "DELIVERY") as! DELIVERYViewController
        ageController = mainStoryboard.instantiateViewController(withIdentifier: "AGE") as! AGEViewController
        
        
        //let customHeaderView = CustomHeaderView.get(title: "", subtitle: "")
        //customHeaderView.backgroundColor = myBlueColor
        
        pivotPageController = MIPivotPageController.get(rootPages: [guideViewController, bmiController, fetalController, deliveryController, ageController]) {
            
            $0.menuView.backgroundColor = myBlueColor
            $0.menuView.layer.shadowColor = UIColor.black.cgColor
            $0.menuView.layer.shadowOpacity = 0.3
            $0.menuView.layer.shadowOffset = CGSize(width: 0, height: 2)
            
            $0.setMenuHeight(60)
            
            //$0.addHeader(headerView: customHeaderView, withHeight: 100)
            
            $0.setStatusBarStyle(.lightContent)
            
    
            
        }
        
        self.navigationController?.pushViewController(pivotPageController, animated: true)
        
        let image = UIImage(named: "share.png")
        let imageNew = resizeImage(image: image!, newWidth: 30)
        pivotPageController.barBI = UIBarButtonItem(image: imageNew, style: UIBarButtonItemStyle.plain, target: self, action: #selector(onBarButtonItem))
        pivotPageController.barBI?.isEnabled = false
        pivotPageController.navigationItem.rightBarButtonItem = pivotPageController.barBI
    }
    
    func onBarButtonItem() {
        var str: String
        switch pivotPageController.selectedIndex {
        case 1:
            str = bmiController.bmiLabel.text!
        case 2:
            str = fetalController.fetalLabel.text!
        case 3:
            str = deliveryController.deliveryLabel.text!
        case 4:
            str = ageController.ageLabel.text!
        default:
            str = ""
        }
        displayShareSheet(shareContent: str)
        
    }
    
    func displayShareSheet(shareContent: String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(newSize)
        
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

