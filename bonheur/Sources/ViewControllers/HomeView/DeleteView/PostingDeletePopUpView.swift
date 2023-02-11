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
        label.layer.cornerRadius = 13
        label.backgroundColor = .green
        label.widthAnchor.constraint(equalToConstant: 257).isActive = true
        label.heightAnchor.constraint(equalToConstant: 213).isActive = true
        return label
    }()
    
    let deleteGuidingText: UITextView = {
        let deleteGuidingText = UITextView()
        deleteGuidingText.text = "행복기록을 삭제하겠습니까?"
        deleteGuidingText.backgroundColor = .clear
        deleteGuidingText.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        deleteGuidingText.font = UIFont(name: "SFPro-Medium", size: 14)
        deleteGuidingText.widthAnchor.constraint(equalToConstant: 170).isActive = true
        return deleteGuidingText
    }()
    
    let warningGuidingText: UITextView = {
        let warningGuidingText = UITextView()
        warningGuidingText.text = "삭제된 행복 기록은 되돌릴 수 없습니다"
        warningGuidingText.backgroundColor = .clear
        warningGuidingText.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        warningGuidingText.font = UIFont(name: "SFPro-Regular", size: 12)
        warningGuidingText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return warningGuidingText
    }()
    
    init() {
        super.init(frame: .zero)
        
        [backgroundLabel, deleteGuidingText, warningGuidingText].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundLabel.layer.zPosition = -1
        deleteGuidingText.translatesAutoresizingMaskIntoConstraints = false
        warningGuidingText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundLabel.topAnchor.constraint(equalTo: topAnchor, constant: 328),
            backgroundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deleteGuidingText.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 26),
            deleteGuidingText.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            warningGuidingText.topAnchor.constraint(equalTo: backgroundLabel.topAnchor, constant: 63),
            warningGuidingText.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
