//
//  ViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 07.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
//    MARK: - IB outlets
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUserData()
    

    
// MARK: - override method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutMeVC = navigationVC.topViewController as! AboutMeViewController
                    aboutMeVC.user = user
                }
            }
        }
    
// MARK: - IB Actions
    @IBAction func logInPressed() {
        if userTextField.text != user.user, passwordTextField.text != user.password {
            showAlert(title: "Oops", message: "Wrong name or password. Please try again.")
        }
        return
    }
    
    @IBAction func showAlertMessage(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "😺", message: "Your name is \(user.user)")
        : showAlert(title: "😺", message: "Your password is \(user.password)")
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {return}
        userTextField.text = ""
        passwordTextField.text = ""
    }
}

    
// MARK: - extensions
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
