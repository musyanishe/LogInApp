//
//  AboutMeViewController.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 12.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    var user: User!

    @IBOutlet var historyLabel: UILabel!
    
    @IBOutlet var backGroundGradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.name
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor, #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor]
        backGroundGradientView.layer.addSublayer(gradientLayer)
    
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        historyLabel.text = """
        Приветствую тебя, Алексей, в моем мире)
        Я инженер-конструктор, закончила МАИ, сейчас нахожусь в декрете.
        У нас растет дочь(1,4 года) - маленькая годзилла с зашкаливающим дерзометром😁 и есть пес, размером с пони)). В общем семью свою очень люблю)
        Мы - спортивная семья. Летом любим пешие походы и плавание всей "стаей" на байдарке, зимой начали осваивать горные лыжи с перспективой освоить кайтинг. Спортивно-туристических планов просто тьма! Мечтаю, плавая на байдарке среди фьордов Норвегии, увидеть китов!
        На данное обучение пошла с целью поменять жизнь к лучшему во многих аспектах: от окружения до зарплаты. А еще потому что ваша команда умеет влюблять в ваше дело, вы действительно самое дружное сообщество по разработке! И я желаю вам успехов и дальнейшего развития!
"""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreInfoVC = segue.destination as? MoreInfoViewController else { return }
        moreInfoVC.user = user
    }

}
