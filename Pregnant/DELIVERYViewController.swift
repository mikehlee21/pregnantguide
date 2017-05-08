//
//  DELIVERYViewController.swift
//  Pregnant
//
//  Created by Admin User on 1/20/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit

class DELIVERYViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDP.datePickerMode = UIDatePickerMode.date
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var myDP: UIDatePicker!
    @IBAction func onDP(_ sender: Any) {

        let dc = DateComponents(month: 9, day: 7)
        let dt = myDP.calendar.date(byAdding: dc, to: myDP.date)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd.MMM.yyyy"
        let estimatedStr = formatter.string(from: dt!)
        deliveryLabel.text = Language.get("Estimated Delivery Date") + "\n" + estimatedStr
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var deliveryLabel: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DELIVERYViewController: MIPivotRootPage {
    
    func imageForPivotPage() -> UIImage? {
        return UIImage(named: "iconD")
    }
    func stringForPivotPage() -> String? {
        return String("Delivery Date")
    }
}
