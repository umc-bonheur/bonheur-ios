//
//  HomeCollectionViewHeader.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/28.
//

import UIKit

class HomeCollectionViewHeader: UICollectionReusableView {
    
    static let identifier = "HomeCollectionViewHeader"
    
    var dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "12월 23일 화요일"
        label.font = UIFont(name: "SFPro-Bold", size: 14)
        label.textColor = .black
        return label
    }()

    func configure() {
        addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor)
        ])
    }
}
