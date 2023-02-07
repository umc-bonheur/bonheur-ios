//
//  PostingDeletePopUpView.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

// 게시물 삭제 Alert CustomView
class PostingDeletePopUpView: UIView {
    
    let backgroundLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 257, height: 213)
        label.layer.cornerRadius = 13
        label.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        [backgroundLabel].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

