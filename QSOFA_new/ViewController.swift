//
//  ViewController.swift
//  QSOFA_new
//
//  Created by Mathias Galthen-Sørensen on 13/09/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score = String()
    var score_ = Int()
    var score_gcs = Int()
    var score_rr = Int()
    var score_sbp = Int()
    var error_gcs = String()
    var error_rr = String()
    var error_sbp = String()
    
    var noInput_gcs = false
    var noInput_rr = false
    var noInput_sbp = false
    
    var result = false  //Used for identifing if result ar without errors.
    
    @IBOutlet var gcs: UITextField!
    @IBOutlet var RR: UITextField!
    @IBOutlet var SBP: UITextField!
   
    @IBAction func reset(_ sender: Any) {
        gcs.text = nil
        RR.text = nil
        SBP.text = nil        
    }

    @IBAction func calcQsofa(_ sender: Any) {
    
        if (gcs.text?.isEmpty)!{
            noInput_gcs = true
        }else{
            noInput_gcs = false
        }

        if (RR.text?.isEmpty)!{
            noInput_rr = true
        }else{
            noInput_rr = false
        }
        
        if (SBP.text?.isEmpty)!{
            noInput_sbp = true
        }else{
            noInput_sbp = false
        }
        
        if let qsofa_gcs = Int(gcs.text!){
            if qsofa_gcs < 3{
                error_gcs = "GCS is a range system given a patient a score between 3 and 15. Please enter a valid score in this range."
            }else if qsofa_gcs > 15{
                error_gcs = "GCS is a range system given a patient a score between 3 and 15. Please enter a valid score in this range."
            }else if qsofa_gcs == 15{
                score_gcs = 0
            }else{
                score_gcs = 1
            }
        }else{
            error_gcs = "GCS is a range system given a patient a score between 3 and 15. Please enter a valid score in this range."
        }
        
        if let qsofa_rr = Int(RR.text!){
            if qsofa_rr == 0{
                error_rr = "Respirations frequens is normally 12-14 in the relaxed patient. A frequens of 0 indicate respiration arrest. Initiate cardiac arrest algorithm."
            }else if qsofa_rr < 0{
                error_rr = "Respirations frequens is normally 12-14 in the relaxed patient. You must enter a possitiv number."
            }else if qsofa_rr > 21{
                score_rr = 1
            }else{
                score_rr = 0
            }
        }else{
            error_rr = "Respirations frequens is normally 12-14 in the relaxed patient. You must enter a possitiv number."
        }
        
        if let qsofa_sbp = Int(SBP.text!){
            if qsofa_sbp < 0{
                error_sbp = "The systolic blodpreassure must be a positive value."
            }else if qsofa_sbp < 100{
                score_sbp = 1
            }else{
                score_sbp = 0
            }
        }else{
            error_sbp = "The systolic blodpreassure must be a positive value."
        }
        
        

        
        
        
        let error = error_gcs + "\n\n" + error_rr + "\n\n" + error_sbp
        
        // resetting error messeges to make sure error doesnt happen if SOFA test is done more than one time
        error_gcs = ""
        error_rr = ""
        error_sbp = ""
        
        // Calculating total score
        score_ = score_gcs + score_rr + score_sbp
        
        if noInput_gcs || noInput_rr || noInput_sbp{
            score = "To calculate the qSOFA-score you need to enter values for all 3 variables."
            result = false
        }else if error == "\n\n\n\n"{
            if score_ > 1{
                score = "The qSOFA score is " + String(score_) + ". The patient is suspected of sepsis. You should evaluate the patient with a SOFA-score."
                result = true
            }else{
                score = "The qSOFA score is " + String(score_) + ". In case you still expect the patient to have sepsis you should do a SOFA-score. Otherwise keep monitoring the patient and reevaluate with a new qSOFA-score if there is changes to the patients clinic."
                result = true
            }
        }else{
            score = error
            result = false
        }
        
        if score != ""{
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var secondControler = segue.destination as! secondViewController
        
        secondControler.myString = score
        secondControler.result_check = result
    }

    
    // Make sure that this viewControler is accesed from other viewControlers
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
    
   
}

