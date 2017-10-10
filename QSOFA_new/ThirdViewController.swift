//
//  ThirdViewController.swift
//  QSOFA_new
//
//  Created by Mathias Galthen-Sørensen on 13/09/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
//Declaring scores
    var score_resp = Int()
    var score_coagulation = Int()
    var score_liver = Int()
    var score_cardio = Int()
    var score_cns = Int()
    var score_renal = Int()
    var score_ = Int()      //the total score
    var score = String()    //the final score message which is send to the 4th viewControler

// Declaring and initializing variable for cheking wheter valid result.
    var result = false
    
//Declaring variable specific error messeges
    var error = String()
    var error_resp = String()
    var error_platelets = String()
    var error_bilirubin = String()
    var error_cardio = String()
    var error_gcs = String()
    var error_renal = String()
    var error_cathecolamin = String()
    
// Declaring variable for cheking if variable is empty
    var noInput_pao2 = false
    var noInput_fio2 = false
    var noInput_platelets = false
    var noInput_bilirubin = false
    var noInput_map = false
    var noInput_gcs = false
    var noInput_creatinin = false
    var noInput_urinOut = false
    
    
// Declaring variabels for chatecolamin check
    var cathecolamin_check = Bool()
    var pressor_check = Int()

    
// Declaring variabel for urinOut check
    var urinOut_check = false
    
// Declaring renal variables
    var sofa_urinOutput = Int()
    
// Declaring variable for controling resp.support switch
    var resp_supp = Bool()
    
    
//declaring textfields
    @IBOutlet var PaO2: UITextField!
    @IBOutlet var FiO2: UITextField!
    @IBOutlet var platelets: UITextField!
    @IBOutlet var bilirubin: UITextField!
    @IBOutlet var map: UITextField!
    @IBOutlet var gcs: UITextField!
    @IBOutlet var creatinin: UITextField!
    @IBOutlet var urinOut: UITextField!
    
    
    @IBOutlet var dopamin: UITextField!
    @IBOutlet var dobutamin: UITextField!
    @IBOutlet var epinephrine: UITextField!
    @IBOutlet var norepinephrine: UITextField!
    
    
    
    @IBAction func reset(_ sender: Any) {
        
        PaO2.text = nil
        FiO2.text = nil
        platelets.text = nil
        bilirubin.text = nil
        map.text = nil
        gcs.text = nil
        creatinin.text = nil
        urinOut.text = nil
        dopamin.text = nil
        dobutamin.text = nil
        epinephrine.text = nil
        norepinephrine.text = nil
    }
    
    @IBAction func respsupp(_ sender: UISwitch) {
        
        if (sender.isOn == true){
            resp_supp = true
        }else{
            resp_supp = false
        }
        
    }
    
    
    @IBAction func newQSofa(_ sender: Any) {
       
    }
    

    @IBAction func SOFAResult(_ sender: Any) {
    // Declaring variabels for calculating PaO2/FiO2-ratio

        var sofa_pao2 = Double()
        var sofa_fio2 = Double()
        var P_F_ratio = Double()
        var error_P_F_ratio = String()
        
        
    // Initializing resp. variabels
        if (PaO2.text?.isEmpty)!{
            sofa_pao2 = Double(0)
        }else{
            sofa_pao2 = Double(PaO2.text!)!
        }

        if (FiO2.text?.isEmpty)!{
            sofa_fio2 = Double(0)
        }else{
            sofa_fio2 = Double(FiO2.text!)!
            sofa_fio2 = sofa_fio2/100
        }
        
        if sofa_fio2 > 0.2{
            P_F_ratio = (sofa_pao2/sofa_fio2)
        }else{
            error_P_F_ratio = "The FiO2 cannot be less than the oxygen percentage of atmospheric air. Enter at least 21."
        }
        

        
    // Declaring chatecholamin variables
        var dopamine = Int()
        var dobutamine = Int()
        var epinephrin_float = Float()
        var epinephrin = Int()
        var norepinephrin_float = Float()
        var norepinephrin = Int()
        
    // Initializing chatacholamin variabels, and checking if field is empty
        
        if (dopamin.text?.isEmpty)!{
            dopamine = 0
        }else{
            dopamine = Int(dopamin.text!)!
        }
        
        if (dobutamin.text?.isEmpty)!{
            dobutamine = 0
        }else{
            dobutamine = Int(dobutamin.text!)!
        }

        if (epinephrine.text?.isEmpty)!{
            epinephrin = 0
        }else{
            epinephrin_float = Float(epinephrine.text!)!
            epinephrin = Int(epinephrin_float*10)
        }
        
        if (norepinephrine.text?.isEmpty)!{
            norepinephrin = 0
        }else{
            norepinephrin_float = Float(norepinephrine.text!)!
            norepinephrin = Int(norepinephrin_float*10)
        }
        
        

        // Cheking for no input i required text fields
        
        if (PaO2.text?.isEmpty)!{
            noInput_pao2 =  true
        }else{
            noInput_pao2 = false
        }
        if (FiO2.text?.isEmpty)!{
            noInput_fio2 =  true
        }else{
            noInput_fio2 = false
        }
        
        if (platelets.text?.isEmpty)!{
            noInput_platelets =  true
        }else{
            noInput_platelets = false
        }
        
        if (bilirubin.text?.isEmpty)!{
            noInput_bilirubin =  true
        }else{
            noInput_bilirubin = false
        }
        
        if (map.text?.isEmpty)!{
            noInput_map =  true
        }else{
            noInput_map = false
        }
        
        if (gcs.text?.isEmpty)!{
            noInput_map =  true
        }else{
            noInput_map = false
        }
        
        if (creatinin.text?.isEmpty)!{
            noInput_creatinin =  true
        }else{
            noInput_creatinin = false
        }
        
        if (urinOut.text?.isEmpty)!{
            noInput_urinOut =  true
        }else{
            noInput_urinOut = false
        }
        
        

        //Calculation of the respiration score for SOFA
        
        if resp_supp == true {
                if P_F_ratio < 0 {
                    error_resp = "You need to enter a positive value in PaO2 and FiO2"
                }else if P_F_ratio < 13.3 {
                    score_resp = 4
                }else{
                    score_resp = 3
                }
        }else{
                if P_F_ratio >= 53.3{
                    score_resp = 0
                }else if P_F_ratio > 40{
                    score_resp = 1
                }else if P_F_ratio > 26.7 {
                    score_resp = 2
                }else if P_F_ratio > 13.3 {
                    score_resp = 3
                }else if P_F_ratio >= 0 {
                    score_resp = 4
                }else{
                    error_resp = "You need to enter a positive value in PaO2/FiO2"
                }
        }

 
      
        //Calculation of the coagulation score for SOFA
        
        if let sofa_platelets = Int(platelets.text!){
            if sofa_platelets >= 150{
                score_coagulation = 0
            }else if sofa_platelets > 100{
                score_coagulation = 1
            }else if sofa_platelets > 50 {
                score_coagulation = 2
            }else if sofa_platelets > 20 {
                score_coagulation = 3
            }else if sofa_platelets >= 0 {
                score_coagulation = 4
            }else{
                error_platelets = "You need to enter a positive value in Platelets"
                
            }
        }else{
            error_platelets = "You need to enter a positive value in Platelets1"

        }
        
 
        //Calculation of the bilirubin score for SOFA
        
        if let sofa_bilirubin = Int(bilirubin.text!){
            if sofa_bilirubin < 0{
                error_bilirubin = "You need to enter a positive value in bilirubin"
            }else if sofa_bilirubin < 20{
                score_liver = 0
            }else if sofa_bilirubin < 32 {
                score_liver = 1
            }else if sofa_bilirubin < 102 {
                score_liver = 2
            }else if sofa_bilirubin < 205 {
                score_liver = 3
            }else if sofa_bilirubin > 204 {
                score_liver = 4
            }else{
                error_bilirubin = "You need to enter a positive value in bilirubin"

            }
        }

   

        //Calculation of the MAP score for SOFA
     
        
        if let sofa_map  = Int(map.text!){
            if dopamine != 0 || dobutamine != 0 || epinephrin != 0 || norepinephrin != 0{
                if dopamine > 15 || epinephrin > 1 || norepinephrin > 1 {
                    score_cardio = 4
                }else if dopamine < 16 || epinephrin <= 1 || norepinephrin <= 1 {
                    score_cardio = 3
                }else if dopamine < 5 || dobutamine > 0 {
                    score_cardio = 2
                }else{
                    error_cathecolamin = "If the patient recived pressors, pleace enter a valid value. Othervise leave textfield empty."
                }
            }else if sofa_map >= 70{
                score_cardio = 0
            }else if sofa_map < 70 && sofa_map >= 0{
                score_cardio = 1
            }else{
                error_cardio = "MAP is a positive value, please enter this."
            }
        }else{
            error_cardio = "MAP is a positive value, please enter this."
        }
        
         
        //Calculation of the GCS score
        
        
        if let sofa_gcs = Int(gcs.text!){
            if sofa_gcs > 15{
                error_gcs = "GCS is a range with a value between 3 and 15. Please enter this."
            }else if sofa_gcs == 15{
                score_cns = 0
            }else if sofa_gcs < 3 {
                error_gcs = "GCS is a range with a value between 3 and 15. Please enter this."
            }else if sofa_gcs >= 13 {
                score_cns = 1
            }else if sofa_gcs >= 10 {
                score_cns = 2
            }else if sofa_gcs >= 6 {
                score_cns = 3
            }else if sofa_gcs < 6 && sofa_gcs >= 3 {
                score_cns = 4
            }
        }
        


        
        //Calculating renal score
        
        if let sofa_urinOutput = Int(urinOut.text!){
            if let sofa_creatinin = Int(creatinin.text!){
                if sofa_urinOutput < 200 && sofa_urinOutput >= 0{
                    score_renal = 4
                }else if sofa_urinOutput < 500 && sofa_creatinin > 400 {
                    score_renal = 4
                }else if sofa_urinOutput < 500 && sofa_creatinin < 400 {
                    score_renal = 3
                }else if sofa_creatinin > 400 {
                    score_renal = 4
                }else if sofa_creatinin > 299 {
                    score_renal = 3
                }else if sofa_creatinin > 170 {
                    score_renal = 2
                }else if sofa_creatinin >= 110 {
                    score_renal = 1
                }else if sofa_creatinin < 110 {
                    score_renal = 0
                }else{
                    error_renal = "You need to put a positive value for crreatinin and urin output."
                }
            }else{
                error_renal = "You need to put a positive value for creatinin"
            }
        }else{
            if let sofa_creatinin = Int(creatinin.text!){
                error_renal = "You need to put a positive value for the urine output."
            }else{
                error_renal = "You need to put a positive value for crreatinin and urin output."
            }
                
        }
       

        // Evaluating error messeges
        
        var error = error_P_F_ratio + "\n" + error_resp + "\n" + error_platelets + "\n" + error_bilirubin + "\n" + error_cardio + "\n" + error_cathecolamin + "\n" + error_gcs + "\n" + error_renal
        
        
        // resetting error messeges to make sure error doesnt happen if SOFA test is done more than one time
        error_P_F_ratio = ""
        error_resp = ""
        error_platelets = ""
        error_bilirubin = ""
        error_cardio = ""
        error_gcs = ""
        error_renal = ""
        error_cathecolamin = ""
        
 
        // Calculating the total score
        score_ = score_resp + score_coagulation + score_liver + score_cardio + score_cns + score_renal
        
        
        if noInput_pao2 == true || noInput_fio2 == true || noInput_platelets == true || noInput_bilirubin == true || noInput_map == true || noInput_gcs == true || noInput_creatinin == true || noInput_urinOut == true {
            
            score = "To calculate the SOFA-score you need to enter values for variables, cathecolamines only if used."
            result = false
        }else if error == "\n\n\n\n\n\n\n" {
            if score_ > 1{
                score = "The SOFA score is \(score_). The patient is septic. You should evaluate if the patient is in shock."
                result = true
                
            }else{
                score = "The SOFA score is \(score_). The patient is not septic."
                result = true

            }
        }else{
            score = error
            error = ""
            result = false
        }
        
        
        
        // making function for transfering the variable score_ to reult label in controlViewer 4
        if score != ""{
            performSegue(withIdentifier: "segueSofa", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var forthControler = segue.destination as! ForthViewController
        
        forthControler.sofa_score = score
        forthControler.result_check = result
        
    
    }
    
    // Make sure that this viewControler is accesed from other viewControlers
    @IBAction func myUnwindAction2(unwindSegue: UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
 

}
