//
//  MainView.swift
//  DrawingCycle
//
//  Created by Roh on 3/11/24.
//

import Foundation
import UIKit

class MainView: UIView {
    override func updateConstraints() {
        super.updateConstraints()
        print("MainView updateConstraints")
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 48
        return size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MainView layoutSubviews")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("MainView draw(rect)")
    }
}
