//
//  ViewController.swift
//  MVVM
//
//  Created by Alex Cruz on 11/14/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit


class GreetingViewController : UIViewController {
    
    // =============
    // MARK: - Enums
    // =============
    
    
    // =================
    // MARK: - Variables
    // =================
    private var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    private let showGreetingButton = UIButton()
    private let greetingLabel = UILabel()
    
    private let buttonWidth: CGFloat = 130
    private let buttonHeight: CGFloat = 50
}

// ================
// MARK: Life Cycle
// ================
extension GreetingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.showGreetingButton.addTarget(viewModel, action: #selector(wrapperFunc), for: .touchUpInside)
        createModel()
        setUpView()
    }
}

// =============
// MARK: Actions
// =============
extension GreetingViewController {
    @objc private func wrapperFunc() {
        viewModel.showGreeting()
    }
}

// =============
// MARK: - Setup
// =============
extension GreetingViewController {
    private func setUpView() {
        showGreetingButton.setTitle("Press me", for: .normal)
        showGreetingButton.backgroundColor = .red
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showGreetingButton)
        NSLayoutConstraint.activate([
             showGreetingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             showGreetingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
             showGreetingButton.widthAnchor.constraint(equalToConstant: buttonWidth),
             showGreetingButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
             greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300)
        ])
    }
}

// ================
// MARK: Data Setup
// ================
extension GreetingViewController {
    private func createModel() {
        // Assembling of MVVM
        let model = Person(firstName: "Alex", lastName: "Knows")
        self.viewModel = GreetingViewModel(person: model)
    }
}



