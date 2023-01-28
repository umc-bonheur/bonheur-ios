//
//  HomeCollectionViewHeader.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/28.
//

import UIKit

class HomeCollectionViewHeader: UICollectionReusableView {
    
    lazy var dateLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "동적으로 변경하기"
        label.textAlignment = .center
        label.font = UIFont(name: "SFPro-Bold", size: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

extension HomeCollectionViewHeader {
    func configure() {
        
        addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 15)
        ])
    }
}
