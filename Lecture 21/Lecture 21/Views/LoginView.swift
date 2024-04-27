//
//  LoginView.swift
//  Lecture 21
//
//  Created by Nika Kakhniashvili on 27.04.24.
//

import UIKit

class LoginViewController: UIViewController {
    private let usernameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton(type: .system)
    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white

        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(usernameTextField)

        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)

        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)

        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            usernameTextField.widthAnchor.constraint(equalToConstant: 200),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 200),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func loginButtonTapped() {
        viewModel.username = usernameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.login { success in
            if success {
                print("Login successful!")
                // Instantiate the next view controller (CountriesViewController) and navigate to it
                let countriesViewController = HomeController() // Replace with your next view controller
                self.navigationController?.pushViewController(countriesViewController, animated: true)
            } else {
                print("Invalid username or password!")
                // Display error message for failed login
            }
        }
    }
    
    private func checkKeychainCredentials() {
            let (username, password) = viewModel.retrieveCredentialsFromKeychain()
            if let savedUsername = username, let savedPassword = password {
                print("Username: \(savedUsername), Password: \(savedPassword)")
                // Credentials are successfully saved in Keychain
            } else {
                print("No credentials found in Keychain")
                // No credentials found in Keychain
            }
        }

}

