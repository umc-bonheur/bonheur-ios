//
//  DeleteCompletionView.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/13.
//

import UIKit

class DeleteCompletionView: UIView {
    let deleteCompletionLabel: UILabel = {
        let label = UILabel()
        label.text = "기록이 삭제되었습니다."
        label.textAlignment = .center
        label.font = UIFont(name: "SFPro-Regular", size: 14)
        label.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        label.layer.backgroundColor = UIColor(red: 0.928, green: 1, blue: 0.821, alpha: 1).cgColor
        label.layer.cornerRadius = 15
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        [deleteCompletionLabel].forEach {
            addSubview($0)
        }
        
        setConstraints()
    }
    
    func setConstraints() {
        deleteCompletionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            deleteCompletionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteCompletionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -98),
            deleteCompletionLabel.widthAnchor.constraint(equalToConstant: 298),
            deleteCompletionLabel.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
