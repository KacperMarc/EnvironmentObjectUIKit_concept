//
//  SecondViewController.swift
//  EnvironmentObjectUIKItConcept
//
//  Created by Kacper Marciszewski on 19/04/2025.
//

import UIKit

class SecondViewController: UIViewController, GlobalUpdating {
    
    @Global var appSettings: AppSettings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdates()
        view.backgroundColor = .systemGreen
    }
    
    func update() {
        print("Updating second view controller")
        title = appSettings.language
    }
}
