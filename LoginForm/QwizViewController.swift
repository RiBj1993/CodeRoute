//
//  QwizViewController.swift
//  LoginForm
//
//  Created by SwiftR on 07/03/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//

import UIKit
import UserNotifications



class QwizViewController:  UIViewController {

  @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
   UNUserNotificationCenter.current().delegate = self
        // Do any additional setup after loading the view.
    }
 
    
     
 
  

    
    @IBAction func Sender() {
        
   let content =   UNMutableNotificationContent()
        content.title = "Pop Qwizz !!"
        content.subtitle = "testez vos connaissance !!"
        content.body = "combien d heure maximum le conducteur peut conduire?"
        content.badge=1
        content.categoryIdentifier="qwizCategory"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let   requestIdentifier = "fricaQwiz"
        let request = UNNotificationRequest(identifier:requestIdentifier , content:   content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
        })
        
    }   }

    

extension UIViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        // some other way of handling notification
        completionHandler([.alert, .sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        switch response.actionIdentifier {
     //   case "answerOne": imageView.image = UIImage(named: "error")
     //   case "answerTwo":  imageView.image = UIImage(named: "correct")
            
        case "answerThree":

            let alert = UIAlertController(title: "Hint", message: "The answer is greater than 29", preferredStyle: .alert)
            let action = UIAlertAction(title: "Thanks!", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        default:
            break
        }
        completionHandler()
        
    }
}



