//
//  TagLabel.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

class TagLabel: UIView {
    var tagLabel: UILabel = {
        var label = UILabel()
        label.text = "Default"
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.layer.backgroundColor = UIColor(red: 0.828, green: 0.946, blue: 0.627, alpha: 1).cgColor
        label.layer.cornerRadius = 13
        label.textAlignment = .center
        
        label.heightAnchor.constraint(equalToConstant: 18).isActive = true
        label.widthAnchor.constraint(equalToConstant: 41).isActive = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [tagLabel].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            tagLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setTagText(tag: Tag) {
        tagLabel.text = tag.tagName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


