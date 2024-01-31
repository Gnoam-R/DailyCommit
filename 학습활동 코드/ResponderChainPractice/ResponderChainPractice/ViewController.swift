//
//  ViewController.swift
//  ResponderChainPractice

import UIKit

class ViewController: UIViewController {
    //MARK: - part1
    @IBOutlet private var directionLabel: UILabel!
    
    //MARK: - part2
    @IBOutlet weak var positionLabel: UILabel!
    
    private var firstValue: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Gesture Recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized(gesture:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(gesture:)))
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(pan)
    }
    
    @objc private func tapGestureRecognized(gesture: UITapGestureRecognizer) {
        
    }

    @objc private func panGestureRecognized(gesture: UIPanGestureRecognizer) {
        var value = gesture.location(in: gesture.view)
        var newValue = gesture.translation(in: gesture.view)
        
        switch gesture.state {
        case .began:
            value = gesture.translation(in: gesture.view)
            print("began", value)
        case .changed:
            newValue = gesture.translation(in: gesture.view)
            print("changed:", newValue)
            if value.x > newValue.x {
                print("value.x: \(value.x), newValue.x: \(newValue.x)")
                print("왼")
                directionLabel.text = "왼쪽"
            }
            else {
                print("오")
                directionLabel.text = "오른쪽"
            }
        
        case .possible:
            break
        case .ended:
            break
        case .cancelled:
            break
        case .failed:
            break
        @unknown default:
            break
        }
        
    }

    @objc private func leftGestureRecognized(_ gesture: UISwipeGestureRecognizer) {
        print("tapGestureRecognized: \(gesture.direction)")
    }

    @objc private func rightGestureRecognized(_ gesture: UISwipeGestureRecognizer) {
        print("tapGestureRecognized: \(gesture.direction)")
    }

    var thumbstickLocation = CGPoint(x: 100, y: 100)
    //MARK: - Touch Event Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let lastTouch : UITouch! = touches.first! as UITouch
//        thumbstickLocation = lastTouch.location(in: self.view)
//        let print = ("thumbstickLocation.x.formatted() + thumbstickLocation")
//        positionLabel.text =
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}

