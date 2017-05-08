//
//  AGEViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit

class AGEViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDP(_ sender: Any) {
        let curDate = Date()
        var dc = Calendar.current.dateComponents([.day], from: myDP.date, to: curDate)
        if (dc.day! < 0) {
            dc.day! = 0
        }
        let estimatedStr = "\(dc.day! / 7) \(Language.get("weeks")) \(dc.day! % 7) \(Language.get("days"))"
        ageLabel.text = Language.get("The age of pregnancy is") + "\n" + estimatedStr

    }
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var myDP: UIDatePicker!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AGEViewController: MIPivotRootPage {
    
    func imageForPivotPage() -> UIImage? {
        return UIImage(named: "iconE")
    }
    func stringForPivotPage() -> String? {
        return String("Age of Pregnancy")
    }
}
