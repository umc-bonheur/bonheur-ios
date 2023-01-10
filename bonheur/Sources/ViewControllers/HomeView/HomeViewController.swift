//
//  HomeViewController.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    var userName: String = "짱제이"
    lazy var topLabelText: String? = "\(self.userName)님의 행복 기록"
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = self.topLabelText
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var cloverChalenderButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "CloverCalender"), for: .normal)
        button.sizeThatFits(CGSize(width: 24, height: 25.2))
        // TODO: button image error
        button.backgroundColor = .systemGreen
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [topLabel, cloverChalenderButton, homeSortStackView].forEach {
            view.addSubview($0)
        }
        
        [latestOrderSortLabel, oldOrderSortLabel, tagSettingButton].forEach {
            homeSortStackView.addArrangedSubview($0)
        }
        
        setConstraints()
        
    }
    
    func setConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        cloverChalenderButton.translatesAutoresizingMaskIntoConstraints = false
        homeSortStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            cloverChalenderButton.topAnchor.constraint(equalTo: topLabel.topAnchor),
            cloverChalenderButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 4),
            
            homeSortStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 36),
            homeSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19)
            
        ])
    }
}

