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
        
//        let notifer = Notifier()
//        let emailNotifier = EmailDecorator(notifier: notifer)
//        let slackNotifier = SlackDecorator(notifier: notifer)
//        slackNotifier.notify(message: "bye")
        
//        let 아메리카노 = 아메리카노(재료: 에스프레소)
//        아메리카노.블랜딩(message: "아메리카노")
        
        let 에스프레소 = 에스프레소()
        에스프레소.블랜딩(message: "에스프레소")
        
        let 카푸치노 = 카푸치노(재료: 에스프레소)
        카푸치노.블랜딩(message: "카푸치노")
        
        let 카페모카 = 카페모카(재료: 카푸치노)
        카페모카.블랜딩(message: "카페모카")
    }


}

