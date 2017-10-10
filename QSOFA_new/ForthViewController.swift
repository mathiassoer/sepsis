//
//  ForthViewController.swift
//  QSOFA_new
//
//  Created by Mathias Galthen-Sørensen on 13/09/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    var sofa_score = String()
    var result_check = Bool()
    
    @IBOutlet var shock_calc: UIBarButtonItem!
    
    @IBOutlet var sofaResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        sofaResult.text = sofa_score
     
        if result_check == false {
            shock_calc.isEnabled = false
        }
        
        
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
