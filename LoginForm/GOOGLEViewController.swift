//
//  GOOGLEViewController.swift
//  LoginForm
//
//  Created by SwiftR on 26/04/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import MobileCoreServices
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

import FirebaseAnalytics


class GOOGLEViewController: UIViewController,UITextFieldDelegate , GIDSignInUIDelegate  {
    let rootRef = FIRDatabase.database().reference()
    let storage = FIRStorage.storage()
    let ref: FIRDatabaseReference? = nil
    
    @IBOutlet weak var signn: GIDSignInButton!
  //  @IBOutlet weak var signnnn: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
         //Handle your logic for siging with social media here
 /*   @IBAction func  connectWithFacebook(_ sender: AnyObject) {
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
        
    }*/
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    func signIn(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("failed to log into google: ", error)
            return
        }
        
        print("successfully logged into google ", user)
        
        guard let idToken = user.authentication.idToken else { return }
        guard let accessToken = user.authentication.accessToken else { return }
        let credentials = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if let error = error {
                print("Faild to create a firebase user with google account: ", error)
                return
            }
            
            guard let uid = user?.uid else { return }
            print("Successfully logged into firebase with google ", uid)
            self.performSegue(withIdentifier: "googleF", sender: self )
            
            
            
            
            
        })
        
    }
    
    
    
    
    @IBAction func connectWithGoogle(_ sender: GIDSignInButton) {
        print("nnnnnnnnnnnnnnnnnnnnn ")
        GIDSignIn.sharedInstance().signIn()
        print("vvvvvvvvvvvvvvvvv: ")
        
    }
}



