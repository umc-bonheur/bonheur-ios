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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [guidingTextLabel].forEach {
            view.addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        guidingTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            guidingTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            guidingTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
