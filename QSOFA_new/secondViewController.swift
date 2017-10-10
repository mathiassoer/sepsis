//
//  secondViewController.swift
//  QSOFA_new
//
//  Created by Mathias Galthen-Sørensen on 13/09/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet var calcSOFA_: UIBarButtonItem!
   
    @IBAction func newQSofa(_ sender: Any) {
        
    }

    @IBAction func calcSOFA(_ sender: Any) {
        
    }
    
    @IBOutlet var label: UILabel!
    
    var myString = String()
    var result_check = Bool()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        label.text = myString
        
        if result_check == false{
            calcSOFA_.isEnabled = false
        }
        
        
        //   if myString = "To calculate the qSOFA-score you need to enter values for all 3 variables." {
      //  calcSOFA_.isEnabled = false
//        }

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
