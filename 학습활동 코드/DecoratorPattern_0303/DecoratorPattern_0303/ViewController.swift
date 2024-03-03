//
//  ViewController.swift
//  DecoratorPattern_0303
//
//  Created by Roh on 3/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let notifer = Notifier()
        let emailNotifier = EmailDecorator(notifier: notifer)
        let slackNotifier = SlackDecorator(notifier: notifer)
        slackNotifier.notify(message: "bye")
        
    }


}

