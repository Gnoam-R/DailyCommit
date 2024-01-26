//
//  protocolEX.swift
//  protocol_ex
//
//  Created by Roh on 1/24/24.
//

import Foundation

protocol stupid {
    var name: String { get set }
    func getStupidMethod()
}

extension stupid {
    func getStupidMethod() {
        print("\(name)은 정말 멍청해")
    }
}

protocol genius {
    var name: String { get set }
    func getGeniusMethod()
}

extension genius {
    func getGeniusMethod() {
        print("\(name)은 정말 똑똑해")
    }
}

struct 노움: stupid {
    var name: String
}

노움.init(name: "노움")
