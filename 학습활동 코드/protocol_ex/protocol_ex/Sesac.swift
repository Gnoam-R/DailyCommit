//
//  Sesac.swift
//  protocol_ex
//
//  Created by Roh on 1/24/24.
//

import Foundation

protocol Sesac {
    var role: String { get set }
}

extension Sesac {
    func setRole() {
        
    }
}

struct burdy: Sesac {
    var role: String
    init() {
        role = "burdy"
    }
}

struct burd: Sesac {
    var role: String
    init() {
        role = "burd"
    }
}

struct reviewer: Sesac {
    var role: String
    init() {
        role = "reviewer"
    }
}

class 포캣몬 {
    var name: String
    var HP: Int
    
    init(name: String, HP: Int) {
        self.name = name
        self.HP = HP
    }
    
    func tell() {
        print("\(name)")
    }
}

class 피까츄: 포캣몬 {
    override func tell() {
        super.tell()
        print("백만볼틔")
    }
}

let hello = 피까츄(name: "피까츄", HP: 100)
hello.tell()

//class 라이츄: 피까츄 {
//    var name: String
//    var HP: String
//    
//    
//    
//}



