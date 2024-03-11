//
//  ViewController.swift
//  DrawingCycle
//
//  Created by Roh on 3/11/24.
//

import UIKit

class ViewController: UIViewController {

    private let myView: MyView = MyView()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print("ViewController updateViewConstraints")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("ViewController viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ViewController viewDidLayoutSubviews")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = MainView()
        self.view = mainView
        addSubView()
        setConstraint()
        
        // Do any additional setup after loading the view.
    }

    private func addSubView() {
        view.addSubview(myView)
    }
    
    private func setConstraint() {
        self.myView.backgroundColor = .red
        let constraints1 = [
          self.myView.heightAnchor.constraint(equalToConstant: 300),
          self.myView.widthAnchor.constraint(equalToConstant: 300),
          self.myView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
          self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints1)
    }
}

