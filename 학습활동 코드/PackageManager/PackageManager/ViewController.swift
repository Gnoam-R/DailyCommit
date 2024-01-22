//
//  ViewController.swift
//  PackageManager
//
//  Created by Roh on 1/22/24.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let animationView = LottieAnimationView(name: "welcome")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(animationView)
        animationView.frame = view.bounds
        animationView.backgroundColor = .white
        animationView.play { completed in
            self.animationView.removeFromSuperview()
        }
        animationView.loopMode = .loop
    }
}

