//
//  HomePostingCollectionViewCell.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/09.
//

import UIKit

class HomePostingCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "HomePostingCollectionViewCell"
    var postingTime: String = "AM 13:59"
    
    public let cellBackgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 335, height: 149))
        view.layer.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.972, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let cellStackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var cellTimeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = self.postingTime
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    let cellTagLabel: UILabel = {
        let label = UILabel()
        label.text = "Tag 1"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1).cgColor
        label.layer.borderWidth = 1

        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 61).isActive = true
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [cellStackView].forEach {
            addSubview($0)
        }
        
        [cellTimeLabel, cellTagLabel].forEach {
            cellStackView.addArrangedSubview($0)
        }
     
        setConstraints()
    }
    
    private func setConstraints() {
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
