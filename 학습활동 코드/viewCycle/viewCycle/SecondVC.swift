//
//  SecondVC.swift
//  viewCycle
//
//  Created by Roh on 1/19/24.
//

import UIKit

class SecondVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC.viewDIDLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondVC.viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondVC.viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondVC.viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondVC.viewDidDisappear")
    }
}
