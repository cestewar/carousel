//
//  SignInViewController.swift
//  carousel
//
//  Created by Cameron Stewart on 9/25/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    //outlet for login fields container
    @IBOutlet weak var loginFormView: UIView!

    //outlets for username and password textfields
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //outlet for description text or logo
    @IBOutlet weak var signInTextImage: UIImageView!
    
    //outlet for sign in buttons view
    @IBOutlet weak var signInButtonsView: UIView!
    
    
    //store var for login form Y
    var loginFormViewOriginalY : CGFloat!
    var signInTextImageY : CGFloat!
    var signInButtonsViewOriginalY : CGFloat!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Detect Keyboards
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        //assign current login form Y to var
        loginFormViewOriginalY = loginFormView.frame.origin.y
        signInTextImageY = signInTextImage.frame.origin.y
        signInButtonsViewOriginalY = signInButtonsView.frame.origin.y
        
        //set loginformview properties before animation
        loginFormView.frame.origin.y = 187
        loginFormView.alpha = 0
        
        //set signInTextImage properties before animation
        signInTextImage.alpha = 0
        signInTextImage.frame.origin.y = 94
        
        //set signinbuttonsview properties
        signInButtonsView.alpha = 0
        signInButtonsView.frame.origin.y = 406
        
        UIView.animateWithDuration(0.3, delay: 0.15, options: [.CurveEaseOut], animations: {
            self.loginFormView.frame.origin.y = 167
            self.loginFormView.alpha = 1
            
            self.signInTextImage.frame.origin.y = 74
            self.signInTextImage.alpha = 1
            
            self.signInButtonsView.frame.origin.y = 426
            self.signInButtonsView.alpha = 1
            }, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboard showing")
        loginFormView.frame.origin.y = 74
        signInTextImage.frame.origin.y = -74
        signInButtonsView.frame.origin.y = 204
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        print("keyboard is hidden")
        loginFormView.frame.origin.y = loginFormViewOriginalY
        signInTextImage.frame.origin.y = signInTextImageY
        signInButtonsView.frame.origin.y = signInButtonsViewOriginalY
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        /*if usernameTextField.text == "" && passwordTextField.text == "" {
            
            print("no username or password text")
            
        } else if usernameTextField.text == "" {
            
            print("no username text")
            
        } else if passwordTextField.text == "" {
            
            print("no password text")
            
        } else {
            print("voila there is text")
        }*/
    }
    
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(
            DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func onSignInButton(sender: AnyObject) {
        
        if usernameTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            print("Shit! username empty")
            //store alert
            let alertController = UIAlertController(title: "Username & Password Empty", message: "Please enter your username and password", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) {(action) in
                //handler response here
            }
            
            //add okAction to alertcontroller
            alertController.addAction(okAction)
            
            //present controller
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else if usernameTextField.text!.isEmpty {
            //store alert
            let alertController = UIAlertController(title: "Username Empty", message: "Please enter your username", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) {(action) in
                //handler response here
            }
            
            //add okAction to alertcontroller
            alertController.addAction(okAction)
            
            //present controller
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        } else if passwordTextField.text!.isEmpty {
            //store alert
            let alertController = UIAlertController(title: "Password Empty", message: "Please enter your password", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) {(action) in
                //handler response here
            }
            
            //add okAction to alertcontroller
            alertController.addAction(okAction)
            
            //present controller
            presentViewController(alertController, animated: true) {
            }
            
        } else if usernameTextField.text == "cameron" && passwordTextField.text == "password" {
            print("correct information!")
            
            //hide keyboard
            loginFormView.endEditing(true)
                
            let signInAlertController = UIAlertController(title: "Signing In...", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(signInAlertController, animated: true) {
            }
            
            delay(1.5){
                //dismiss alertview
                signInAlertController.dismissViewControllerAnimated(true, completion: nil)
                
                //execute sign in function
                print("Signed In!")
                self.performSegueWithIdentifier("signInSegue", sender: nil)
                
            }//end delay
            
        } else {
            
            let signInAlertController = UIAlertController(title: "Signing In...", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(signInAlertController, animated: true) {
            }
            
            delay(1){
                //dismiss alertview
                signInAlertController.dismissViewControllerAnimated(true, completion: nil)
                
                //execute sign in function
                print("Wrong username and password!")
                
                //store alert
                let alertController = UIAlertController(title: "Incorrect Login", message: "Wrong username and/or password", preferredStyle: .Alert)
                
                let okAction = UIAlertAction(title: "OK", style: .Default) {(action) in
                    //handler response here
                }
                
                //add 'ok' Action button to alertcontroller
                alertController.addAction(okAction)
                
                //present controller
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            }//end delay
            
            
        }
        
    }
    
    //hide keyboard tap recognizer
    @IBAction func onTap(sender: AnyObject) {
        loginFormView.endEditing(true)
    }
    
    //go back dismiss view
    @IBAction func onBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
