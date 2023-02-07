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
    var postingList: [String] = ["Default"]
    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = self.topLabelText
        label.font = UIFont(name: "NanumSquareRoundOTFEB", size: 24)
        return label
    }()

    lazy var cloverCalendarButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloverCalendar"), for: .normal)
        button.sizeThatFits(CGSize(width: 24, height: 25.2))
        button.tintColor = .black
        button.addTarget(self, action: #selector(cloverCalendarButtonTapped), for: .touchUpInside)

        return button
    }()
    
    let dividerLine = dividerUIView(height: 0.5, color: UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1))

    let defaultCloverImage: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 154, height: 160))
        imageView.image = UIImage(named: "DefaultCloverImage")
        return imageView
    }()
    
    let defaultTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 202, height: 78)
        label.text = "행복 기록이 없어요.\n아래 세잎클로버 버튼을 눌러\n오늘의 행복을 기록해주세요 :)"
        label.textAlignment = .center
        label.numberOfLines = 3
        label.font = UIFont(name: "SFPro-Regular", size: 16)
        label.textColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
        return label
    }()
    
    public var homePostingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomePostingCollectionViewCell.self,
                                forCellWithReuseIdentifier: HomePostingCollectionViewCell.identifier)
        collectionView.register(HomeCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeCollectionViewHeader.identifier)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: -5, left: 20, bottom: 10, right: 20)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        homePostingCollectionView.delegate = self
        homePostingCollectionView.dataSource = self
        
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.headerMode = .supplementary

        [topLabel, cloverCalendarButton, homeSortStackView, dividerLine, homePostingCollectionView].forEach {
            view.addSubview($0)
        }
        
        [latestOrderSortLabel, oldOrderSortLabel, tagSettingButton].forEach {
            homeSortStackView.addArrangedSubview($0)
        }
        
        if postingList.count == 0 {
            [defaultCloverImage, defaultTextLabel].forEach {
                view.addSubview($0)
            }
        }
        
        setConstraints()
    }

    private func setConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        cloverCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        homeSortStackView.translatesAutoresizingMaskIntoConstraints = false
        dividerLine.translatesAutoresizingMaskIntoConstraints = false
        homePostingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),

            cloverCalendarButton.topAnchor.constraint(equalTo: topLabel.topAnchor),
            cloverCalendarButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),

            homeSortStackView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 36),
            homeSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            dividerLine.topAnchor.constraint(equalTo: homeSortStackView.bottomAnchor, constant: 6),
            dividerLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerLine.widthAnchor.constraint(equalTo: view.widthAnchor),
                    
            homePostingCollectionView.topAnchor.constraint(equalTo: dividerLine.bottomAnchor),
            homePostingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            homePostingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -82)
        ])
        
        if postingList.count == 0 {
            defaultCloverImage.translatesAutoresizingMaskIntoConstraints = false
            defaultTextLabel.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                defaultCloverImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 298),
                defaultCloverImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                defaultTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 474),
                defaultTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    }
    
    @objc func cloverCalendarButtonTapped() {
        let calendarVC = CalendarViewController()
        
        navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    @objc func tagSettingButtonTapped() {
        let tagSelectModalViewController = UINavigationController(rootViewController: TagSelectModalViewController())
        tagSelectModalViewController.modalPresentationStyle = .pageSheet

        if let sheet = tagSelectModalViewController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(tagSelectModalViewController, animated: true, completion: nil)
    }
    
    @objc func moreButtonTapped() {
        let postingEditPopUpViewController = PostingEditPopUpViewController()
        postingEditPopUpViewController.modalPresentationStyle = .overFullScreen
        present(postingEditPopUpViewController, animated: false)
    }
}
