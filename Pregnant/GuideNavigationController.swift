//
//  GuideNavigationController.swift
//  Pregnant
//
//  Created by Admin User on 1/21/17.
//  Copyright © 2017 Admin User. All rights reserved.
//

import UIKit

class GuideNavigationController: UINavigationController {

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

extension GuideNavigationController: MIPivotRootPage {
    
    func imageForPivotPage() -> UIImage? {
        return UIImage(named: "")
    }
    func stringForPivotPage() -> String? {
        return String("Guide")
    }
    
}
