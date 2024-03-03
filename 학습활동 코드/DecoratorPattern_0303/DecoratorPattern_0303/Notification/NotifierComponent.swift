//
//  Notification.swift
//  DecoratorPattern_0303
//
//  Created by Roh on 3/3/24.
//

import Foundation

// Component
protocol NotifierComponent {
    func notify(message: String)
}

// Concrete Component
class Notifier: NotifierComponent {
    func notify(message: String) {
        print("\(message) 전송완료")
    }
}

// Decorator
// Decorator는 wrapper의 역할을 하며 객체를 참조해줄 wrapper 필드를 만들어줘야 한다
protocol NotifierDecorator: NotifierComponent {
    var wrapper: NotifierComponent { get set }
    init(notifier: NotifierComponent)
}

// Concrete Decorator
class EmailDecorator: NotifierDecorator {
    var wrapper: NotifierComponent
    
    required init(notifier: NotifierComponent) {
        self.wrapper = notifier
    }
    
    func notify(message: String) {
        let to = getInfo()
        print("\(to)에게 Email로 \(message) 전송완료")
        self.wrapper.notify(message: message)
    }
    
    func getInfo() -> String {
        print("보낼 Email 주소를 입력하세요: ", separator: "", terminator: "")
        return readLine()!
    }
}

// Concrete Decorator
class SlackDecorator: NotifierDecorator {
    var wrapper: NotifierComponent
    
    required init(notifier: NotifierComponent) {
        self.wrapper = notifier
    }
    
    func notify(message: String) {
        let to = companyInfo()
        print("\(to) Slack 채널에 \(message) 전송완료")
        wrapper.notify(message: message)
    }
    
    func companyInfo() -> String {
        print("보낼 Company 채널을 입력하세요 : ", separator: "", terminator: "")
        guard let text = readLine() else {
            return ""
        }
        return text
    }
}
