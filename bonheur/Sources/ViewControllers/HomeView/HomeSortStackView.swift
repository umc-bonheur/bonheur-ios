//
//  HomeSortStackView.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/09.
//

import UIKit

let latestOrderSortLabel: UILabel = {
    let label = UILabel()
    label.text = "최신순"
    label.font = UIFont(name: "SFPro-Regular", size: 12)

    label.layer.backgroundColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1).cgColor
    label.layer.cornerRadius = 13
    label.textAlignment = .center
    
    label.widthAnchor.constraint(equalToConstant: 50).isActive = true
    label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    return label
}()

let oldOrderSortLabel: UILabel = {
    let label = UILabel()
    label.text = "오래된순"
    label.font = UIFont(name: "SFPro-Regular", size: 12)
    
    label.layer.backgroundColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1).cgColor
    label.layer.cornerRadius = 13
    label.textAlignment = .center
    
    label.widthAnchor.constraint(equalToConstant: 61).isActive = true
    label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    return label
}()

let tagSettingButton: UIButton = {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "Tune"), for: .normal)
    button.sizeThatFits(CGSize(width: 18, height: 18))
    button.tintColor = .black
    return button
}()

public var homeSortStackView: UIStackView = {
    var stackView: UIStackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    return stackView
}()
