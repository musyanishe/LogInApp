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
    
    let user = User(name: "Alexey", password: "Welcome")
    
// MARK: - override method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
        welcomeVC.welcomeLB = user.name
    }
    
// MARK: - IB Actions
    @IBAction func logInPressed() {
        guard nameTextField.text == user.name, passwordTextField.text == user.password else {
            showAlert(title: "Oops", message: "Wrong name or password. Please try again.")
            return
        }
        performSegue(withIdentifier: "WelcomeSegue", sender: nil)
    }
    
    @IBAction func showAlertMessage(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "😺", message: "Your name is \(user.name)")
        : showAlert(title: "😺", message: "Your password is \(user.password)")
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
