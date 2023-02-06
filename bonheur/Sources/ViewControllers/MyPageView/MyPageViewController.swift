//
//  MyPageViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController {
    
    let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
        $0.showsVerticalScrollIndicator = false
    }
    
    let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let settingImageView = UIImageView().then {
        $0.image = UIImage(named: "setting")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var settingBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let nicknameView = NicknameView()
    let countCloverView = CountCloverView()
    let statsView = StatsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        nicknameView.backgroundColor = .white
        countCloverView.backgroundColor = .white
        statsView.backgroundColor = .white
        scrollView.insetsLayoutMarginsFromSafeArea = (0 != 0)
        
        settingBtn.addTarget(self, action: #selector(settingBtnTapped), for: .touchUpInside)
        nicknameView.editNicknameBtn.addTarget(self, action: #selector(editNicknameBtnTapped), for: .touchUpInside)
        
        setUpView()
        setUpConstraints()
    }
    
    // 네비게이션 바 숨기기
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        setUpNavBar()
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // 다른 뷰로 이동 시 네비게이션 바 보이게 설정
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        tabBarController?.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpView() {
        self.view.addSubview(settingBtn)
        settingBtn.addSubview(settingImageView)
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        [nicknameView, countCloverView, statsView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        
        settingBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.trailing.equalToSuperview().inset(14.28)
            $0.height.equalTo(Constant.height * 20)
            $0.width.equalTo(Constant.width * 19.45)
        }
        settingImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollView.snp.makeConstraints {
            $0.top.equalTo(settingImageView.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            $0.width.equalToSuperview()
        }
        nicknameView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(countCloverView.snp.top)
        }
        countCloverView.snp.makeConstraints {
            $0.top.equalTo(nicknameView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(statsView.snp.top)
        }
        statsView.snp.makeConstraints {
            $0.top.equalTo(countCloverView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc
    func editNicknameBtnTapped() {
        let editProfileViewController = EditProfileViewController()
        navigationController?.pushViewController(editProfileViewController, animated: false)
    }
    
    @objc
    func settingBtnTapped() {
        let settingViewController = SettingViewController()
        navigationController?.pushViewController(settingViewController, animated: false)
    }
}
