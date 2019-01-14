//
//  DefaultsStorage.swift
//  TemplateProject
//

import Foundation


//
class DefaultsStorage: LocalStorage {
    
    let keyIsFirstStart = "keyIsFirstStart"
    let keyServerToken = "keyServerToken"
    
    
    // обязательное свойство по протоколу
    var token: String? {
        get {
            return (UserDefaults.standard.object(forKey: keyServerToken) as? String)
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: keyServerToken)
            UserDefaults.standard.synchronize()
        }
    }
    
    // обязательное свойство по протоколу
    var isFirstStart: Bool {
        get {
            return (UserDefaults.standard.object(forKey: keyIsFirstStart) as? Bool) ?? true
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: keyIsFirstStart)
            UserDefaults.standard.synchronize()
        }
    }
}
