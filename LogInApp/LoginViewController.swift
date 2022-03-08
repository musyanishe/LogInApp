//
//  ViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 07.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
//    MARK: - IB outlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
//    MARK: - public properties
    let name = "Alexey"
    let password = "Welcome"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcomeLB = "Welcome, \(name)!"
    }
    

    
// MARK: - IB Actions
    @IBAction func logInPressed(_ sender: UIButton) {
        guard let inputName = nameTextField.text, inputName != name, inputName.isEmpty,
              let inputPassword = passwordTextField.text, inputPassword != password, inputPassword.isEmpty else {
                  showAlert(title: "Oops", message: "Wrong name or password. Please try again.")
                  return
              }
    }
    
    
    
    @IBAction func forgotNamePressed(_ sender: UIButton) {
                showAlert(title: "😺", message: "Your name is \(name)")
            self.nameTextField.text = ""
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
            showAlert(title: "😺", message: "Your password is \(password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {return}
        nameTextField.text = ""
        passwordTextField.text = ""
    }
    
// MARK: - private method
                private func showAlert(title: String, message: String) {
                    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                        self.passwordTextField.text = ""
                    }
                    alert.addAction(okAction)
                    present(alert, animated: true)
                }


}
