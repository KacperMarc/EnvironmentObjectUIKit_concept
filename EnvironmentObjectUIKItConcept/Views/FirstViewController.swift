//
//  FirstViewController.swift
//  EnvironmentObjectUIKItConcept
//
//  Created by Kacper Marciszewski on 19/04/2025.
//

import Foundation
import UIKit

class FirstViewController: UIViewController, GlobalUpdating {
    
   
    @Global var userSettings: UserSettings
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(button)
        setupUI()
        registerForUpdates()
    }
    
    func update() {
        print("Updating first view controller")
        title = userSettings.authenticationString
    }
      
    private func setupUI() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Authenticate", for: .normal)
        button.addTarget(self, action: #selector(authenticate), for: .touchUpInside)
        return button
    }()
    
    @objc func authenticate() {
        userSettings.isAuthenticated.toggle()
        
    }
    
}
