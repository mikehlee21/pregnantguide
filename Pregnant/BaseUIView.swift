//
//  BaseUIView.swift
//  MultiLanguageSwift3
//
//  Created by Nguyen Van Thieu B on 11/9/16.
//  Copyright © 2016 Thieu Mao. All rights reserved.
//

import UIKit

class BaseUIView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var listLanguageView = [UIView]()
    var listLanguageText = [String]()
    
    // Define identifier
    let notificationName = Notification.Name("Did selected language")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupLanguage()
        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.observerDidChangeLanguage), name: notificationName, object: nil)
    }
    
    func observerDidChangeLanguage(_ notification: Notification) {
        self.setupLanguage()
    }
    
    deinit {
        // Stop listening notification
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil);
    }
    
    func getLanguageFor(_ parentView: UIView) {
        for view: UIView in parentView.subviews {
            if (view is UILabel) {
                listLanguageView.append(view)
                var text = (view as! UILabel).text!
                if text == "" {
                    text = ""
                }
                listLanguageText.append(text)
            }
            else if (view is UITextField) {
                let textField = (view as! UITextField)
                listLanguageView.append(view)
                var text = textField.placeholder!
                if text == "" {
                    text = ""
                }
                listLanguageText.append(text)
            }
            else if (view is UIButton) {
                let button = (view as! UIButton)
                listLanguageView.append(view)
                var text = button.title(for: .normal)!
                if text == "" {
                    text = ""
                }
                listLanguageText.append(text)
            }
            else {
                self.getLanguageFor(view)
            }
        }
    }
    
    func setupLanguage() {
        if listLanguageView.isEmpty {
            listLanguageView = [UIView]()
            listLanguageText = [String]()
            self.getLanguageFor(self)
        }
        for i in 0..<listLanguageView.count {
            let view = listLanguageView[i]
            if (view is UILabel) {
                (view as! UILabel).text = Language.get(listLanguageText[i])
            }
            else if (view is UITextField) {
                let textField = (view as! UITextField)
                textField.placeholder! = Language.get(listLanguageText[i])
            }
            else if (view is UIButton) {
                let button = (view as! UIButton)
                button.setTitle(Language.get(listLanguageText[i]), for: .normal)
            }
        }
    }
    
}
