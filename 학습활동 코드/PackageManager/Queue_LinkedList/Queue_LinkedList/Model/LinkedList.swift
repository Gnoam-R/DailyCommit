//
//  LinkedList.swift
//  Queue_LinkedList
//
//  Created by Roh on 1/22/24.
//

import Foundation

struct LinkedList <Element> {
    var head: Node<Element>?
    var tail: Node<Element>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func push(_ value: Element) {
        head = Node(data: value)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ value: Element) {
        guard !isEmpty else {
            print("11111")
            push(value)
            return
        }
        print("2222")
        tail?.next = Node(data: value)
        tail = tail?.next
    }
    
    mutating func pop() -> Element? {
        let returnValue = head?.data
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return returnValue
    }
}

