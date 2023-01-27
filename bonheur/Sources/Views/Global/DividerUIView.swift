//
//  DividerUIView.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/23.
//

import UIKit

func dividerUIView(height: CGFloat, color: UIColor) -> UIView {
    let dividerUIView = UIView()
    dividerUIView.backgroundColor = color
    dividerUIView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        dividerUIView.heightAnchor.constraint(equalToConstant: height)
    ])
    
    return dividerUIView
}
