//
//  PostingDeletePopUpView.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

// 게시물 삭제 Alert CustomView
class PostingDeletePopUpView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.widthAnchor.constraint(equalToConstant: 257).isActive = true
        view.heightAnchor.constraint(equalToConstant: 213).isActive = true
        return view
    }()
    
    let deleteGuidingText: UITextView = {
        let deleteGuidingText = UITextView()
        deleteGuidingText.text = "행복 기록을 삭제하겠습니까?"
        deleteGuidingText.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        deleteGuidingText.font = UIFont(name: "SFPro-Medium", size: 14)
        deleteGuidingText.textAlignment = .center
        return deleteGuidingText
    }()
    
    let warningGuidingText: UITextView = {
        let warningGuidingText = UITextView()
        warningGuidingText.text = "삭제된 행복 기록은 되돌릴 수 없습니다"
        warningGuidingText.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        warningGuidingText.font = UIFont(name: "SFPro-Regular", size: 12)
        warningGuidingText.textAlignment = .center
        return warningGuidingText
    }()
    
    let dividerLine = dividerUIView(height: 0.5, color: UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1))

    init() {
        super.init(frame: .zero)
        
        [backgroundView, deleteGuidingText, warningGuidingText, dividerLine].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        deleteGuidingText.translatesAutoresizingMaskIntoConstraints = false
        warningGuidingText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 328),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // TODO: Text 표시 X error
            deleteGuidingText.topAnchor.constraint(equalTo: topAnchor, constant: 354),
            deleteGuidingText.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteGuidingText.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            warningGuidingText.topAnchor.constraint(equalTo: topAnchor, constant: 391),
            warningGuidingText.centerXAnchor.constraint(equalTo: centerXAnchor),
            warningGuidingText.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            dividerLine.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 110),
            dividerLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            dividerLine.widthAnchor.constraint(equalTo: backgroundView.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
