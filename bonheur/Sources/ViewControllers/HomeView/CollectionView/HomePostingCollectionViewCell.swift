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
    
    // dummy data
    private var postingTagLabelList: [Tag] = [Tag(tagName: "행복", tagID: 123),
                                              Tag(tagName: "사랑", tagID: 456),
                                              Tag(tagName: "기쁨", tagID: 789),
                                              Tag(tagName: "행복", tagID: 123),
                                              Tag(tagName: "사랑", tagID: 456),
                                              Tag(tagName: "기쁨", tagID: 789)]
    
    private var tagLabelList: [TagLabel] = []
    
    public let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.972, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var cellStackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        // stackView.alignment = .leading
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var cellTimeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = self.postingTime
        label.textAlignment = .center
        label.font = UIFont(name: "SFPro-Regular", size: 10)
        return label
    }()
    
    let postingMoreButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "ThreeDots"), for: .normal)
        button.sizeThatFits(CGSize(width: 24, height: 24))
        button.tintColor = .black
        button.addTarget(HomeViewController(), action: #selector(HomeViewController.moreButtonTapped), for: .touchUpInside)
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
        // TODO: 더보기 기능 구현
        postingText.backgroundColor = .clear
        postingText.widthAnchor.constraint(equalToConstant: 224).isActive = true
        postingText.heightAnchor.constraint(equalToConstant: 82).isActive = true
        return postingText
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [cellTimeLabel, cellStackView, postingMoreButton, postingImage, postingText].forEach {
            self.addSubview($0)
        }

        for tag in postingTagLabelList {
            let tagLabel = TagLabel()
            tagLabel.setTagText(tag: tag)
            tagLabelList.append(tagLabel)
        }

        tagLabelList.forEach {
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
            
            cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90),
            cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            
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
