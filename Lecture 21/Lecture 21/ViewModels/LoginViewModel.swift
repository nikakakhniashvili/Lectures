//
//  LoginViewModel.swift
//  Lecture 21
//
//  Created by Nika Kakhniashvili on 27.04.24.
//

import Foundation

class LoginViewModel {
    var username: String = ""
    var password: String = ""

    func login(completion: @escaping (Bool) -> Void) {
        // Always assume login is successful and save credentials to Keychain
        saveCredentialsToKeychain()
        completion(true)
    }

    private func saveCredentialsToKeychain() {
        // Use your Keychain service here to save user credentials securely
        KeychainService.save(username: username, password: password)
    }

    func retrieveCredentialsFromKeychain() -> (username: String?, password: String?) {
        // Use your Keychain service here to retrieve user credentials
        let username = KeychainService.retrieveUsername()
        let password = KeychainService.retrievePassword()
        return (username, password)
    }
}
