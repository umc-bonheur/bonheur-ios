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

     let deleteGuidingLabel: UILabel = {
         let label = UILabel()
         label.text = "행복 기록을 삭제하겠습니까?"
         label.textAlignment = .center
         label.font = UIFont(name: "SFPro-Bold", size: 14)
         label.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
         return label
     }()

    let warningGuidingLabel: UILabel = {
        let label = UILabel()
        label.text = "삭제된 행복 기록은 되돌릴 수 없습니다"
        label.textAlignment = .center
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        return label
    }()
    
    let popUpDeleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 14)
        button.setTitleColor(UIColor(red: 1, green: 0.341, blue: 0.196, alpha: 1), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let popUpCancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Regular", size: 14)
        button.setTitleColor(UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    let firstDividerLine = dividerUIView(height: 0.5, color: UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1))
    let secondDividerLine = dividerUIView(height: 0.5, color: UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1))

    init() {
        super.init(frame: .zero)
        
        [backgroundView, deleteGuidingLabel, warningGuidingLabel, firstDividerLine, secondDividerLine, popUpDeleteButton, popUpCancelButton].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        deleteGuidingLabel.translatesAutoresizingMaskIntoConstraints = false
        warningGuidingLabel.translatesAutoresizingMaskIntoConstraints = false
        popUpDeleteButton.translatesAutoresizingMaskIntoConstraints = false
        popUpCancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 328),
            backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deleteGuidingLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 26),
            deleteGuidingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteGuidingLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            warningGuidingLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 63),
            warningGuidingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            warningGuidingLabel.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            firstDividerLine.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 110),
            firstDividerLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstDividerLine.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            secondDividerLine.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 159),
            secondDividerLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondDividerLine.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            
            popUpDeleteButton.topAnchor.constraint(equalTo: firstDividerLine.bottomAnchor),
            popUpDeleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            popUpDeleteButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            popUpDeleteButton.heightAnchor.constraint(equalToConstant: 49),
            
            popUpCancelButton.topAnchor.constraint(equalTo: secondDividerLine.bottomAnchor),
            popUpCancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            popUpCancelButton.widthAnchor.constraint(equalTo: backgroundView.widthAnchor),
            popUpCancelButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
