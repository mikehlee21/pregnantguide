//
//  BMIViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit


class BMIViewController: UIViewController {

    @IBAction func onCalc(_ sender: Any) {
        if(weightTF.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: Language.get("Enter Weight(kg)"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(heightTF.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: Language.get("Enter Height(cm)"), preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let bw = Int(weightTF.text!)
            let bh = Int(heightTF.text!)
            let bmi = Float(bw!) / Float(bh! * bh!) * 10000
            var degree = String("")
            var strw = String("")
            if (bmi < 19.8) {
                degree = Language.get("Underweight")
                strw = "18"
            }
            else if (bmi < 26) {
                degree = Language.get("Normal")
                strw = "16"
            }
            else if (bmi < 29) {
                degree = Language.get("Overweight")
                strw = "11.5"
            }
            else {
                degree = Language.get("Obese")
                strw = "6.8"
            }
            
            let str1 = Language.get("Body Mass Index") + "\n" + String(bmi) + "\n"
            let str2 = degree! + "\n" + Language.get("Weight gain up to") + " " + strw! + " kg"
            bmiLabel.text = str1 + str2
        }
    }
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var weightTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSLog("BMI")
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

extension BMIViewController: MIPivotRootPage {
    
    func imageForPivotPage() -> UIImage? {
        return UIImage(named: "iconB")
    }
    func stringForPivotPage() -> String? {
        return String("BMI")
    }
}

