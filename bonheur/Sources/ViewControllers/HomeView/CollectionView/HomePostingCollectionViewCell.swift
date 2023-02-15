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
    private var postingTagLabelList: [Tag] = [Tag(tagName: "첫 번째", tagID: 123),
//                                              Tag(tagName: "동적으로 보여지는 태그", tagID: 456),
                                              Tag(tagName: "두 번째", tagID: 789),
                                              Tag(tagName: "세 번째", tagID: 123),
                                              Tag(tagName: "네 번째", tagID: 456),
                                              Tag(tagName: "다섯 번째", tagID: 789)
                                              ]
    
    private var tagLabelList: [TagLabel] = []
    
    public let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.972, alpha: 1).cgColor
        view.layer.cornerRadius = 15
        return view
    }()

    private let cellScrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        return scrollView
    }()
    
    private let cellStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 50
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
        backgroundColor = .white
        
//        getTagWithAPI(tagName: "인천")
        
        [cellTimeLabel, cellScrollView, postingMoreButton, postingImage, postingText].forEach {
            self.addSubview($0)
        }

        // tagList 구성
        for tag in postingTagLabelList {
            let tagLabel = TagLabel()
            tagLabel.setTagText(tag: tag)
            tagLabelList.append(tagLabel)
        }

        tagLabelList.forEach {
            cellStackView.addArrangedSubview($0)
        }
        
        cellScrollView.addSubview(cellStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        cellTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cellScrollView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        postingMoreButton.translatesAutoresizingMaskIntoConstraints = false
        postingImage.translatesAutoresizingMaskIntoConstraints = false
        postingText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellTimeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            cellScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            cellScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            cellScrollView.widthAnchor.constraint(equalToConstant: 225),
            cellScrollView.heightAnchor.constraint(equalToConstant: 18),
            
            cellStackView.topAnchor.constraint(equalTo: cellScrollView.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: cellScrollView.leadingAnchor),
            cellStackView.heightAnchor.constraint(equalTo: cellScrollView.heightAnchor),
            
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

extension HomePostingCollectionViewCell {
    func getTagWithAPI(tagName: String) {
        TagAPI.shared.getTag(tagName: tagName) { (response) in
            switch response {
            case .success(let tagID):
                print("logoutWithAPI - success \(tagID)")
            case .requestError(let resultCode, let message):
                print("logoutWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("logoutWithAPI - pathError")
            case .serverError:
                print("logoutWithAPI - serverError")
            case .networkFail:
                print("logoutWithAPI - networkFail")
            }
        }
    }
}

