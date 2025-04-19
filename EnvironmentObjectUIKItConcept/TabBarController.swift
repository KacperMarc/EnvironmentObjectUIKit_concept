//
//  ViewController.swift
//  EnvironmentObjectUIKItConcept
//
//  Created by Kacper Marciszewski on 12/03/2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    lazy var firstVC = FirstViewController()
    lazy var secondVC = SecondViewController()
    lazy var thirdVC = ThirdViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        
        // Do any additional setup after loading the view.
        let vc1 = UINavigationController(rootViewController: firstVC)
        let vc2 = UINavigationController(rootViewController: secondVC)
        let vc3 = UINavigationController(rootViewController: thirdVC)
        vc1.tabBarItem.image = UIImage(systemName: "tablecells.fill")
        vc2.tabBarItem.image = UIImage(systemName: "map.circle")
        vc3.tabBarItem.image = UIImage(systemName: "location.magnifyingglass")
        setViewControllers([vc1, vc2, vc3], animated: true)
        vc1.title = "Auth"
        vc2.title = "Lang"
        vc3.title = "Summary"
    }
    


}

