//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Makayla Rodriguez on 3/8/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        
        let username = usernameTF.text!
        let password = passwordTF.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
        
        user.username = usernameTF.text
        user.password = passwordTF.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
