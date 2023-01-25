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
        label.font = UIFont(name: "SFPro-Medium", size: 16)
        label.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        return label
    }()
    
    lazy var modalDismissButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ModalDismissButton"), for: .normal)
        button.sizeThatFits(CGSize(width: 10, height: 10))
        button.tintColor = .black
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(HomeViewController.modalDismissButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [guidingTextLabel, modalDismissButton].forEach {
            view.addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        guidingTextLabel.translatesAutoresizingMaskIntoConstraints = false
        modalDismissButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            guidingTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 23),
            guidingTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            modalDismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 27.28),
            modalDismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.28)
            
        ])
    }
}
