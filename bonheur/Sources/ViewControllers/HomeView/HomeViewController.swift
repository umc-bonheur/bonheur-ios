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
        button.setBackgroundImage(UIImage(named: "CloverCalender"), for: .normal)
        button.sizeThatFits(CGSize(width: 24, height: 25.2))
        button.tintColor = .black
        return button
    }()
    
    public var homePostingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomePostingCollectionViewCell.self,
                                forCellWithReuseIdentifier: HomePostingCollectionViewCell.identifier)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homePostingCollectionView.delegate = self
        homePostingCollectionView.dataSource = self
        
        [topLabel, cloverChalenderButton, homeSortStackView, homePostingCollectionView].forEach {
            view.addSubview($0)
        }
        
        [latestOrderSortLabel, oldOrderSortLabel, tagSettingButton].forEach {
            homeSortStackView.addArrangedSubview($0)
        }
        
        homePostingCollectionView.delegate = self
        homePostingCollectionView.dataSource = self
        
        setConstraints()
    }
    
    private func setConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        cloverChalenderButton.translatesAutoresizingMaskIntoConstraints = false
        homeSortStackView.translatesAutoresizingMaskIntoConstraints = false
        homePostingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            cloverChalenderButton.topAnchor.constraint(equalTo: topLabel.topAnchor),
            cloverChalenderButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 4),
            
            homeSortStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 36),
            homeSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            homePostingCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 231),
            homePostingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            homePostingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -82),
            homePostingCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
