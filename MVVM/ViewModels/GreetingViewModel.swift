//
//  GreetingViewModel.swift
//  MVVM
//
//  Created by Alex Cruz on 11/14/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit


class GreetingViewModel : GreetingViewModelProtocol {
    let person: Person
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    required init(person: Person) {
        self.person = person
    }
    func showGreeting() {
        print("Show Greeting")
        self.greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
    }
}
