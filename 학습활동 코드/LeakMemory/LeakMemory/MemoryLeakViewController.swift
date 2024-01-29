//
//  MemoryLeakViewController.swift
//  LeakMemory
//
//  Created by Do Yi Lee on 1/29/24.
//

import UIKit

class MountainView: UIView {
    var delegate: Leakable?
}

class MemoryLeakViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mountainView = MountainView()
        mountainView.delegate = self
        view.addSubview(mountainView)
    }
    
    @IBAction func didButtonTouched(_ sender: Any) {
        self.dismiss(animated: true )
        self.createLeaks()
    }
}

extension MemoryLeakViewController: Leakable {
    func createLeaks() {
        print("호호호 하하하")
    }
}


