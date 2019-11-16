//
//  GreetingViewModelProtocol.swift
//  MVVM
//
//  Created by Alex Cruz on 11/14/19.
//  Copyright © 2019 Alex Cruz. All rights reserved.
//

import UIKit

protocol GreetingViewModelProtocol: class {
    
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
    
    init(person: Person)
    func showGreeting()
}
