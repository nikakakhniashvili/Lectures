//
//  Keychain.swift
//  Lecture 21
//
//  Created by Nika Kakhniashvili on 27.04.24.
//

import Foundation
import Security

class KeychainService {
    static let serviceName = "YourAppName"

    static func save(username: String, password: String) {
        // Implementation to save username and password to Keychain
    }

    static func retrieveUsername() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecSuccess {
            if let existingItem = item as? [String: Any],
               let usernameData = existingItem[kSecAttrAccount as String] as? Data,
               let username = String(data: usernameData, encoding: .utf8) {
                return username
            }
        }

        return nil
    }

    static func retrievePassword() -> String? {
        print("Attempting to retrieve password from Keychain")
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: serviceName,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)

        if status == errSecSuccess {
            if let existingItem = item as? [String: Any],
               let passwordData = existingItem[kSecValueData as String] as? Data,
               let password = String(data: passwordData, encoding: .utf8) {
                print("Password retrieved from Keychain: \(password)")
                return password
            }
        } else {
            print("Failed to retrieve password from Keychain")
        }

        return nil
    }




}

