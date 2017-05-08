//
//  FETALViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit

class FETALViewController: UIViewController {
    
    @IBAction func onCalc(_ sender: Any) {
        if(fetalTF.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: Language.get("Enter High Uterine Fundus(cm)"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if(segmented.selectedSegmentIndex == 0) {
                let HUF = Int(fetalTF.text!)
                let EFW = String((HUF! - 11) * 155)
                fetalLabel.text = Language.get("Estimated Weight:") + " " + EFW + "g"
            }
            else {
                let HUF = Int(fetalTF.text!)
                let EFW = String((HUF! - 12) * 155)
                fetalLabel.text = Language.get("Estimated Weight:") + " " + EFW + "g"
            }
        }
    }
    @IBOutlet weak var fetalLabel: UILabel!
    @IBOutlet weak var fetalTF: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension FETALViewController: MIPivotRootPage {
    
    func imageForPivotPage() -> UIImage? {
        return UIImage(named: "iconC")
    }
    func stringForPivotPage() -> String? {
        return String("Fetal Weight")
    }
}
