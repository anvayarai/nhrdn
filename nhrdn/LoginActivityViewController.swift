//
//  LoginActivityViewController.swift
//  nhrdn
//
//  Created by Stacks and Queues on 09/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit

class LoginActivityViewController: UIViewController {

    @IBOutlet weak var user_unique_name: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func btn_login(sender: AnyObject) {
        self.user_unique_name.resignFirstResponder()
        self.password.resignFirstResponder()
    }
    
    // To remove editing of the UID and Pswd, gives up first responder and removes the soft keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
  /*  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
