//
//  gnoam.swift
//  DecoratorPattern_0303
//
//  Created by Roh on 3/3/24.
//

import Foundation

// Component
protocol 커피원두 {
    func 블랜딩(message: String)
}

// Concrete Component
class 에스프레소: 커피원두 {
    func 블랜딩(message: String) {
        print("\(message) 만듬")
        print("---------주문 완료-----------")
    }
}

// Decorator
protocol Decorator: 커피원두 {
    var wrapper: 커피원두 { get set }
    init(재료: 커피원두)
}

// Concrete Decorator
class 아메리카노: Decorator {
    var wrapper: 커피원두
    
    required init(재료: 커피원두) {
        self.wrapper = 재료
    }
    
    func 블랜딩(message: String) {
        물추가()
        self.wrapper.블랜딩(message: message)
    }
    
    private func 물추가() {
        print("물 넣어")
    }
}

// Concrete Decorator
class 카푸치노: Decorator {
    var wrapper: 커피원두
    
    required init(재료: 커피원두) {
        self.wrapper = 재료
    }
    
    func 블랜딩(message: String) {
        우유추가()
        self.wrapper.블랜딩(message: message)
    }
    
    private func 우유추가() {
        print("우유 넣어")
    }
}

// Concrete Decorator
class 카페모카: Decorator {
    var wrapper: 커피원두
    
    required init(재료: 커피원두) {
        self.wrapper = 재료
    }
    
    func 블랜딩(message: String) {
        초코시럽추가()
        휘핑크림추가()
        self.wrapper.블랜딩(message: message)
    }
    
    private func 초코시럽추가() {
        print("초코시럽 넣어")
    }
    
    private func 휘핑크림추가() {
        print("휘핑크림 넣어")
    }
}


