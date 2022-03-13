//
//  MoreInfoViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 12.03.2022.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet var photoView: UIImageView! {
        didSet {
            photoView.layer.cornerRadius = 20
        }
    }
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoView.image = UIImage(named: user.person.image)

    }
    

}
