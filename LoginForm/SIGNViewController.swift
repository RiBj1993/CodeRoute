//
//  SIGNViewController.swift
//  LoginForm
//
//  Created by SwiftR on 25/04/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

import GoogleSignIn


class SIGNViewController: UIViewController ,UITextFieldDelegate {
 
    
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var password: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
              
    }
    
    @IBAction func signin(_ sender: AnyObject) {
        
        //first take the email and password from the views
        let email =  self.email.text
        let password =  self.password.text
        
        if (email?.trimmingCharacters(in: .whitespacesAndNewlines) != ""  ||   password?.trimmingCharacters(in: .whitespacesAndNewlines) != "" ) {
        
        FIRAuth.auth()?.createUser(withEmail: email!, password: password!, completion: { (user: FIRUser?, error) in
            if error == nil {
                 print("registration successful")
                
                let alert = UIAlertController(title: "registration successful", message: nil, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              
                self.present( alert, animated: true, completion: nil)

             
                
            }else{
                let alert = UIAlertController(title: "essayer plus tard", message: nil, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
               
                 self.present(alert, animated: true, completion: nil)

            }
        })
        
        }else{
            let alert = UIAlertController(title: "verifier email ou password", message: nil, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
             self.present(alert, animated: true, completion: nil)

        }

        
        
    }
     
   
      }
