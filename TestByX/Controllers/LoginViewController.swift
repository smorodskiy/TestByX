//
//  LoginViewController.swift
//  TestByX
//
//  Created by Igor on 07.01.2019.
//  Copyright © 2019 Dejavu. All rights reserved.
//

import UIKit
import Alamofire
import SkyFloatingLabelTextField



class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var UserNameTextF: SkyFloatingLabelTextField!
    @IBOutlet weak var PasswordTextF: SkyFloatingLabelTextField!

    
    func alertShow(text: String) {
        let alert = UIAlertController(title: "", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    


    
    func AlamoPost(name: String?, password: String?) {
        
        let loginRequest = [
            "name": name,
            "password": password
        ]
        
        Alamofire.request(serverUrl, method: .post, parameters: loginRequest as Parameters, encoding: JSONEncoding.default, headers: nil)
            .responseJSON { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                print("statusCode: ", statusCode)
                
                guard let value = response.value else { return }
                print("value: ", value)
                
                self.alertShow(text: "\(statusCode) + \(value)")
                //print(response)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    @IBAction func ButtonGetStarted(_ sender: UIButton) {
        
        if UserNameTextF.text == "" || PasswordTextF.text == "" {
            
            alertShow(text: "Введите Email и пароль")
            
        } else {
            
            AlamoPost(name: UserNameTextF.text, password: PasswordTextF.text)
            
        }
        
        
    }
    
}
