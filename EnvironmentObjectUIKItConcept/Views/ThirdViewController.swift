//
//  ThirdViewController.swift
//  EnvironmentObjectUIKItConcept
//
//  Created by Kacper Marciszewski on 19/04/2025.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController, GlobalUpdating {
    @Global var appSettings: AppSettings
    @Global var userSettings: UserSettings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForUpdates()
        view.backgroundColor = .systemBlue
        view.addSubview(stackView)
        setupUI()
        
    }
    func update() {
        print("Updating third view controller")
        self.authLabel.text = userSettings.authenticationString
        self.langLabel.text = appSettings.language
        title = "Summary"
    }
    private func setupUI() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
            ])
    }
    
    lazy var authLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "auth"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    lazy var langLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "lang"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [authLabel, langLabel])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
}
