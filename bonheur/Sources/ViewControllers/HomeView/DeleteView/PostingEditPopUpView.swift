//
//  PostingEditPopUpView.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

// 삭제하기, 수정하기 버튼 뷰
class PostingEditPopUpView: UIView {
    let postingDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        button.layer.cornerRadius = 13
        return button
    }()
    
    let postingEditButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 16)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
        button.layer.cornerRadius = 13
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        postingDeleteButton.addTarget(self.postingDeleteButton, action: #selector(PostingEditPopUpViewController.postingDeleteButtonTapped), for: .touchUpInside)
        
        [postingDeleteButton, postingEditButton].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        postingDeleteButton.translatesAutoresizingMaskIntoConstraints = false
        postingEditButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            postingDeleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -93),
            postingDeleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            postingDeleteButton.widthAnchor.constraint(equalToConstant: 344),
            postingDeleteButton.heightAnchor.constraint(equalToConstant: 51),
            
            postingEditButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            postingEditButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            postingEditButton.widthAnchor.constraint(equalToConstant: 344),
            postingEditButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
