//
//  UITextField+Extension.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/25.
//

import UIKit

extension UITextField {
    func setUnderLine(lineColor: UIColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0,
                                  y: self.bounds.height + 3,
                                  width: self.bounds.width,
                                  height: 1.5)
        bottomLine.backgroundColor = lineColor.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
