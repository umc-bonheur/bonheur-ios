//
//  HomeViewController.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // 로그인 여부에 관련된 참/거짓을 저장하는 속성
    var isLoggedIn = true
    
    
    var userName: String = "짱제이"
//    lazy var topLabelText: String? = "\(self.userName)님의 행복 기록"
//
//    lazy var topLabel: UILabel = {
//        let label = UILabel()
//        label.text = self.topLabelText
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        return label
//    }()
//
//    lazy var cloverCalendarButton: UIButton = {
//        let button = UIButton()
//        button.setBackgroundImage(UIImage(named: "CloverCalendar"), for: .normal)
//        button.sizeThatFits(CGSize(width: 24, height: 25.2))
//        button.tintColor = .black
//
//        // 버튼 눌렀을시 cloverCalendarButtonTapped 함수 실행
//        button.addTarget(self, action: #selector(cloverCalendarButtonTapped), for: .touchUpInside)
//
//        return button
//    }()
    
    
    
    
    
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
        
        [homeSortStackView, homePostingCollectionView].forEach {
            view.addSubview($0)
        }
        
        [latestOrderSortLabel, oldOrderSortLabel, tagSettingButton].forEach {
            homeSortStackView.addArrangedSubview($0)
        }
        
        homePostingCollectionView.delegate = self
        homePostingCollectionView.dataSource = self
        
        setConstraints()
        
        setNavigation()
    }
    
    
    // 다음화면을 띄우는 더 정확한 시점 ⭐️⭐️⭐️
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        if !isLoggedIn {
            let vc = OnboardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
    }
    
    
    private func setConstraints() {
//        topLabel.translatesAutoresizingMaskIntoConstraints = false
//        cloverCalendarButton.translatesAutoresizingMaskIntoConstraints = false
        homeSortStackView.translatesAutoresizingMaskIntoConstraints = false
        homePostingCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//            topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//
//            cloverCalendarButton.topAnchor.constraint(equalTo: topLabel.topAnchor),
//            cloverCalendarButton.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 4),
            
            homeSortStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            homeSortStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            
            homePostingCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 231),
            homePostingCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            homePostingCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -82),
            homePostingCollectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
    
    
    func setNavigation() {
        
        let titleName = UILabel()
        //titleName.text = "\(self.userName)님의 행복 기록"
        titleName.font = UIFont(name: "NanumSquareRoundOTFB", size:  24)
        //titleName.textColor = .magenta
        //titleName.sizeToFit()
        
        
        self.navigationItem.titleView = titleName
        
        //self.navigationItem.title = "\(self.userName)님의 행복 기록"
        
        // 네비게이션바 우측에 캘린더 버튼 만들기
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "CloverCalendar"), style: .done, target: self, action: #selector(cloverCalendarButtonTapped))
        
        
        UINavigationBarAppearance().configureWithTransparentBackground()  // 투명으로

        
        
        
       
        let customView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 310.0, height: 44.0))
        //customView.backgroundColor = UIColor.yellow

        //var button = UIButton.init(type: .custom)
        //button.setBackgroundImage(UIImage(named: "hamburger"), for: .normal)
        //button.frame = CGRect(x: 0.0, y: 5.0, width: 32.0, height: 32.0)
        //button.addTarget(self, action: #selector(menuOpen(button:)), for: .touchUpInside)
        //customView.addSubview(button)

        //var marginX = CGFloat(button.frame.origin.x + button.frame.size.width + 5)
        let label = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 310.0, height: 140.0))
        label.text = "\(self.userName)님의 행복 기록"
        label.font = UIFont(name: "NanumSquareRoundOTFB", size:  24)
        label.textAlignment = NSTextAlignment.left
        //label.backgroundColor = UIColor.red
        customView.addSubview(label)
        
        
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton

        
        
        
        
        // 네비게이션 바 뒤로가기 버튼(버튼만 나오게)
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
    }
    
    @objc func cloverCalendarButtonTapped() {
        let calendarVC = CalendarViewController()
        
        navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    
}

