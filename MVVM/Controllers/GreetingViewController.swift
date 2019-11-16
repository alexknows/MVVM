//
//  ViewController.swift
//  MVVM
//
//  Created by Alex Cruz on 11/14/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit


class GreetingViewController : UIViewController {
    
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.showGreetingButton.addTarget(viewModel, action: #selector(wrapperFunc), for: .touchUpInside)
        createModel()
        setUpView()
    }
    
    @objc func wrapperFunc() {
        viewModel.showGreeting()
    }
    
    func setUpView() {
        showGreetingButton.setTitle("Press me", for: .normal)
        showGreetingButton.backgroundColor = .red
        showGreetingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showGreetingButton)
        NSLayoutConstraint.activate([
             showGreetingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             showGreetingButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
             showGreetingButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 50)
        ])
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
             greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
             greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300)
        ])
    }
}

extension GreetingViewController {
    func createModel() {
        // Assembling of MVVM
        let model = Person(firstName: "David", lastName: "Blaine")
        self.viewModel = GreetingViewModel(person: model)
    }
}



