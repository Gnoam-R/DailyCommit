//
//  Queue.swift
//  Queue_LinkedList
//
//  Created by Roh on 1/22/24.
//

struct Queue <Element> {
    
    private var queue: LinkedList = LinkedList<Element>()
    private var loop: Bool = true
    
    mutating func enqueue(item: Element) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Element? {
        return queue.pop()
    }
    
    func peek() -> Element? {
        return queue.head?.data
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }

    mutating func clear() {
        while loop {
            guard let queueValue = queue.pop() else {
                loop = false
                return
            }
            print("queueValue: ", queueValue)
        }
    }
}
