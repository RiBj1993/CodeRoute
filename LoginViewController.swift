//
//  LoginViewController.swift
//  LoginForm
//
//  Created by vishalsonawane on 12/12/16.
//  Copyright © 2016 vishalsonawane. All rights reserved.
//

import UIKit


import FirebaseAuth
import  FirebaseDatabase
import MobileCoreServices

import FBSDKLoginKit

import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

import FirebaseAnalytics
// MARK: RegEX Declaraions
let REGEX_EMAIL = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
let REGEX_PASSWORD_LIMIT = "^.{6,20}$"
let REGEX_PASSWORD = "[A-Za-z0-9]{6,20}"

class LoginViewController: UIViewController,UITextFieldDelegate  {
    let rootRef = FIRDatabase.database().reference()
    let storage = FIRStorage.storage()
     let ref: FIRDatabaseReference? = nil
    // MARK: Declarations
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var connectWithGoogleButton: UIButton!
    @IBOutlet weak var connectWithFBButton: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordTextField: TextFieldValidator!
    @IBOutlet  weak var emailTextField: TextFieldValidator!
    
    /*
     
     UIViewController {
     let rootRef = FIRDatabase.database().reference()
     let storage = FIRStorage.storage()
     let ref: FIRDatabaseReference? = nil
     @IBOutlet var email: UITextField!
     
     @IBOutlet var password: UITextField!
     
     @IBAction func loggin(_ sender: Any) {
     
     
     print(email.text as Any)
     print (password.text as Any)
     
     FIRAuth.auth()?.signIn(withEmail: email.text as Any as! String, password:
     password.text as Any as! String,completion: { (user, error) in
     
     if let u = user{
     print ("user exists and logged")
     
     
     self.performSegue(withIdentifier: "home", sender: self)
     
     }
     else{
     print ("no user ")}
     
     })
     
     
     
     
     }*/
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        backgroundView.addGradientWithColor(color: UIColor.blue)
        navigationController?.navigationBar.isHidden = true
        emailTextField.delegate = self
        
        emailTextField.addRegx(REGEX_EMAIL, withMsg: "Enter valid email.")
        passwordTextField.addRegx(REGEX_PASSWORD_LIMIT, withMsg: "Password length should be between 6-20")
      
        passwordTextField.addRegx(REGEX_PASSWORD, withMsg: "Password must be alpha numeric")
        
        emailTextField.text="rihabbeji@yahoo.fr"
        
        passwordTextField.text="balalaw"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   // MARK: Button Actions
   @IBAction func signIn(_ sender: AnyObject) {
             print("Signing In..")
      /*  print("Email text: \(emailTextField.text!)")
        
        self.view.endEditing(true)
        
        if(emailTextField.validate() && passwordTextField.validate())
        {
            print("everything is ok")
        }else{
            print("Something is wrong")
        }*/
    
    //passwordTextField: TextFieldValidator!
    // @IBOutlet  weak var emailTextField: TextFieldValidator!
    
    FIRAuth.auth()?.signIn(withEmail: emailTextField.text as Any as! String, password:
        passwordTextField.text as Any as! String,completion: { (user, error) in
            
            if user != nil{
                print ("user exists and logged")
                
                
                self.performSegue(withIdentifier: "showMenuSegue", sender: self)
                
            }
            else{
                print ("no user ")}
            
    })
    
    
    }
    
    @IBAction func forgotPassword(_ sender: AnyObject) {
    }

    //Handle your logic for siging with social media here
    @IBAction func connectWithFacebook(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        print("Logging In")
        facebookLogin.logIn(withReadPermissions: ["email"], from: self, handler:{(facebookResult, facebookError) -> Void in
            if facebookError != nil { print("jhkjh")
             
                
            } else if (facebookResult?.isCancelled)! { print("Facebook login was cancelled.")
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                print("You’re inz 😉")
                FIRAuth.auth()?.signIn(with: credential) { (user, error) in
                        self.performSegue(withIdentifier: "signF", sender: self )
                    if error == nil {
                      self.performSegue(withIdentifier: "signF", sender: self )
                        
                    }
                }}
        });
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    

   
    @IBAction func connectWithGoogle(_ sender: Any) {
            
  

}
    
    
    func authUI(authUI: FIRAuthUI, didSignInWithUser user: FIRUser?, error: NSError?) {
        // Here is where we add code after logging in
    }
}
