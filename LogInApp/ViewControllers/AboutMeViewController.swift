//
//  AboutMeViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 12.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.user = user
    }

}
