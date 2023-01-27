//
//  SelectedTagStackView.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/25.
//

import UIKit

var selectedTagList: [UILabel] = []

// TODO: Tag와 Button 기능의 UIView class 설계

let selectedTag: UILabel = {
    let label = UILabel()
    label.text = "학교"
    label.font = UIFont(name: "SFPro-Regular", size: 12)
    
    label.layer.backgroundColor = UIColor(red: 0.828, green: 0.946, blue: 0.627, alpha: 1).cgColor
    label.layer.cornerRadius = 13
    label.textAlignment = .center
    
    label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    return label
}()
