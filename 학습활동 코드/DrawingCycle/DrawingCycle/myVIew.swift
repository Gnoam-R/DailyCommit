//
//  myVIew.swift
//  DrawingCycle
//
//  Created by Roh on 3/11/24.
//

import Foundation
import UIKit

class MyView: UIView {
    override func updateConstraints() {
        super.updateConstraints()
        print("MyView updateConstraints")
    }
    
    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height = 48
        return size
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyView layoutSubviews")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("MyView draw(rect)")
    }
}
