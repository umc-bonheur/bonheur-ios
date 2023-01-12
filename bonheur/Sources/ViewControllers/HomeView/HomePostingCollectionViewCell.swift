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
        let view = UIView()
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
        return label
    }()
    
    let cellTagLabel: UILabel = {
        let label = UILabel()
        label.text = "Tag 1"
        label.font = UIFont.systemFont(ofSize: 10)
        
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1).cgColor
        label.layer.borderWidth = 1

        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 41).isActive = true
        label.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return label
    }()
    
    let postingMoreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ThreeDots"), for: .normal)
        button.sizeThatFits(CGSize(width: 24, height: 24))
        button.tintColor = .black
        return button
    }()
    
    let postingImage: UIImageView = {
        let postingImage = UIImageView()
        postingImage.image = UIImage(named: "PostingImageExample")
        postingImage.widthAnchor.constraint(equalToConstant: 82).isActive = true
        postingImage.heightAnchor.constraint(equalToConstant: 82).isActive = true
        return postingImage
    }()
    
    let postingText: UITextView = {
        let postingText = UITextView()
        postingText.text = "오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다.오늘은 밥을 먹었다. 밥이 맛있었다."
        
        postingText.backgroundColor = .clear
        postingText.widthAnchor.constraint(equalToConstant: 224).isActive = true
        postingText.heightAnchor.constraint(equalToConstant: 82).isActive = true
        return postingText
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [cellTimeLabel, cellStackView, postingMoreButton, postingImage, postingText].forEach {
            addSubview($0)
        }
        
        [cellTagLabel].forEach {
            cellStackView.addArrangedSubview($0)
        }
     
        setConstraints()
    }
    
    private func setConstraints() {
        cellTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        postingMoreButton.translatesAutoresizingMaskIntoConstraints = false
        postingImage.translatesAutoresizingMaskIntoConstraints = false
        postingText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 72),
            cellStackView.widthAnchor.constraint(equalToConstant: 215),
            
            postingMoreButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            postingMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -13),
            
            postingImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            postingImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            postingText.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            postingText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 102)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
