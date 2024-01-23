//
//  ViewController.swift
//  Queue_LinkedList
//
//  Created by Roh on 1/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var q = Queue<String>()
//        let qq = Queue<Int>()
        
        q.enqueue(item: "1111")
        q.enqueue(item: "2222")
        q.enqueue(item: "3333")
        q.clear()
        
//        print(q.dequeue()!)
//        print(q.dequeue()!)
//        print(q.dequeue()!)
//    
//        qq.enqueue(item: 1111)
//        qq.enqueue(item: 2222)
//        qq.enqueue(item: 3333)
//        print(qq.dequeue()!)
//        print(qq.dequeue()!)
//        print(qq.dequeue()!)
    }


}

