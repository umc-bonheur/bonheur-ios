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
    
    lazy var settingNavBtn = UIButton().then {
        $0.setImage(UIImage(named: "setting"), for: .normal)
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
        
        // 네비게이션 바 커스텀
        setupNavigationBackButton(UIImage(named: "arrow-left"))
        tabBarController?.navigationItem.setRightBarButton(UIBarButtonItem(customView: settingNavBtn), animated: false)
        settingNavBtn.addTarget(self, action: #selector(settingBtnTapped), for: .touchUpInside)
        nicknameView.editNicknameBtn.addTarget(self, action: #selector(editNicknameBtnTapped), for: .touchUpInside)
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        [nicknameView, countCloverView, statsView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setUpConstraints() {
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
