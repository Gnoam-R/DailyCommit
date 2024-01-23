//
//  Node.swift
//  Queue_LinkedList
//
//  Created by Roh on 1/22/24.
//

import Foundation

class Node<Element> {
    var data: Element
    var next: Node?
    
    init(data: Element) {
        self.data = data
        print("Node with \(data) has been created.")
    }
    
    deinit {
        print("Node with \(data) has been expired.")
    }
}
