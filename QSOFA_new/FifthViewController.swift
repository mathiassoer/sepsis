//
//  FifthViewController.swift
//  QSOFA_new
//
//  Created by Mathias Galthen-Sørensen on 16/09/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {

    
    var MAP = Bool()
    var lactat = Bool()
    
    
    @IBOutlet var shockResult: UILabel!
    
    @IBAction func MAP_switch(_ sender: UISwitch) {
    
        if (sender.isOn == true){
            MAP = true
        }else{
            MAP = false
        }
    }
    
    @IBAction func lactat_switch(_ sender: UISwitch) {
        
        if (sender.isOn == true){
            lactat = true
        }else{
            lactat = false
        }
    }
    
    
    @IBAction func sepsisButton(_ sender: Any) {
        
        if MAP == true && lactat == true{
            shockResult.text = "Yes, the patient is in septic shock!"
        }else{
            shockResult.text = "No, the patient is not in septic shock!"
        }
        
    }
    
    
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
