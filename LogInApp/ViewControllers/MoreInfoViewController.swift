//
//  MoreInfoViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 12.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var backGroundGradientView: UIView!
    @IBOutlet var photoView: UIImageView! {
        didSet {
            photoView.layer.cornerRadius = 20
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = user.person.name
        photoView.image = UIImage(named: user.person.image)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor]
        backGroundGradientView.layer.addSublayer(gradientLayer)
    
        view.layer.insertSublayer(gradientLayer, at: 0)

    }
    

}
