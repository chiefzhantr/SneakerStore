//
//  accountService.swift
//  SneakerStore
//
//  Created by Admin  on 16.12.2023.
//

import Foundation

final class AccountService {
    private let userdefaults = UserDefaults.standard
    
    private var user : User?
    
    init() {
        if let retrievedData = userdefaults.dictionary(forKey: "userDataKey"),
           let savedUsername = retrievedData["username"] as? String,
           let savedPassword = retrievedData["password"] as? String {
            let shoeSize = retrievedData["shoeSize"] as? String
            self.user = User(username: savedUsername, password: savedPassword, shoeSize: shoeSize)
        }
        user = nil
    }
    
    func createUser(username: String, password: String) {
        let userData = ["username": username, "password": password, "shoeSize": ""]
        userdefaults.set(userData, forKey: "userDataKey")
        self.user = User(username: username, password: password, shoeSize: "")
        signIn()
    }
    
    func checkUser(username: String, password: String) -> Bool {
        guard let user = user else {
            return false
        }
        
        if user.username == username && user.password == password {
            signIn()
            return true
        }
        return false
    }
    
    func getUser() -> User? {
        return self.user
    }
    
    func isLogged() -> Bool {
        userdefaults.bool(forKey: "isLogged")
    }
    
    private func signIn() {
        userdefaults.set(true, forKey: "isLogged")
    }
    
    func signOut() {
        userdefaults.set(false, forKey: "isLogged")
    }
}
