//
//  TitleStackView.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/12.
//

import UIKit

class TitleStackView: UIStackView {
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "나만의 작은 행복 보관함"
        label.font = UIFont(name: "NanumSquareRoundOTFEB", size: 16)
        
        return label
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "bonheur"
        label.font = UIFont(name: "NanumSquareRoundOTFEB", size: 48)
        
        return label
    }()

    init() {
        super.init(frame: CGRect(origin: CGPoint.zero, size: CGSize.zero))
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [subTitleLabel, titleLabel].forEach {
            self.addArrangedSubview($0)
        }
        
        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
