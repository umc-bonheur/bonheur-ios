//
//  TagSelectModalViewController.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/23.
//

import UIKit

class TagSelectModalViewController: UIViewController {
    
    let guidingTextLabel: UILabel = {
        let label = UILabel()
        label.text = "해시태그 선택"
        label.textAlignment = .center
        label.font = UIFont(name: "SFPro-Bold", size: 16)
        label.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        return label
    }()
    
    lazy var modalDismissButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ModalDismissButton"), for: .normal)
        button.sizeThatFits(CGSize(width: 10, height: 10))
        button.tintColor = .black
        button.addTarget(self, action: #selector(HomeViewController.modalDismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var tagAddingTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "해시태그 추가"
        textField.backgroundColor = .clear
        return textField
    }()
    
    let warningTextLabel: UILabel = {
        let label = UILabel()
        label.text = "10자 이내로 입력 가능합니다."
        label.font = UIFont(name: "SFPro-Regular", size: 12)
        label.textColor = UIColor(red: 1, green: 0.341, blue: 0.196, alpha: 1)
        return label
    }()
    
    let selectCompleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("선택 완료", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Bold", size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        button.layer.cornerRadius = 13
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [guidingTextLabel, modalDismissButton, tagAddingTextField, warningTextLabel, selectCompleteButton].forEach {
            view.addSubview($0)
        }
        
        tagAddingTextField.becomeFirstResponder()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tagAddingTextField.setUnderLine(lineColor: .lightGray)
    }
    
    private func setConstraints() {
        guidingTextLabel.translatesAutoresizingMaskIntoConstraints = false
        modalDismissButton.translatesAutoresizingMaskIntoConstraints = false
        tagAddingTextField.translatesAutoresizingMaskIntoConstraints = false
        warningTextLabel.translatesAutoresizingMaskIntoConstraints = false
        selectCompleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            guidingTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23),
            guidingTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            modalDismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 27.28),
            modalDismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.28),
            
            tagAddingTextField.topAnchor.constraint(equalTo: guidingTextLabel.bottomAnchor, constant: 31),
            tagAddingTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tagAddingTextField.widthAnchor.constraint(equalToConstant: 323),
            
            warningTextLabel.topAnchor.constraint(equalTo: tagAddingTextField.bottomAnchor, constant: 10),
            warningTextLabel.leadingAnchor.constraint(equalTo: tagAddingTextField.leadingAnchor),
            
            selectCompleteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -37),
            selectCompleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectCompleteButton.widthAnchor.constraint(equalToConstant: 251),
            selectCompleteButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}
