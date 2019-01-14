//
//  Alamofire.swift
//  TestByX
//
//  Created by Igor on 13.01.2019.
//  Copyright © 2019 Dejavu. All rights reserved.
//

import Alamofire

func sendAlamoMessage(login: String?, password: String?) {
    
    // Параметры для запроса - словарем
    let loginRequest = [
        "login": login,
        "password": password
    ]
    // Post-запрос авторизации посредством Alamofire
    Alamofire.request(serverUrl + "/api/v1/security/auth/login", method: .post, parameters: loginRequest as Parameters, encoding: JSONEncoding.default, headers: nil)
        .responseJSON { response in
            
            if response.result.isSuccess {
                
                if response.response?.statusCode == 201 {
                    
                    let authentication = try? JSONDecoder().decode(Authentication.self, from: response.data!)
                    
                    let storage = DefaultsStorage()
                    storage.isFirstStart = true
                    storage.token = authentication?.token
                    
                    print(storage.token!)
                    switchScreen(identifier: "MyNewsVC")
                    return
                    
                } else {
                    alertShow(text: "FUCK")
                }
                
            } else {
                
                print("FUCK")
                
            }
            
            
    }
    
}
