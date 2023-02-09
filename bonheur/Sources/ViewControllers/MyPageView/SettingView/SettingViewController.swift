//
//  SettingViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class SettingViewController: UIViewController {
    
    let settingView = SettingView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        // 화면이동
        settingView.notifBtn.addTarget(self, action: #selector(notifBtnTapped), for: .touchUpInside)
        settingView.feedbackBtn.addTarget(self, action: #selector(feedbackBtnTapped), for: .touchUpInside)
        settingView.reviewBtn.addTarget(self, action: #selector(reviewBtnTapped), for: .touchUpInside)
        settingView.instagramBtn.addTarget(self, action: #selector(instagramBtnTapped), for: .touchUpInside)
        settingView.developerIntroductionBtn.addTarget(self, action: #selector(developerIntroductionBtnTapped), for: .touchUpInside)
        
        // 회원탈퇴
        settingView.withdrawalBtn.addTarget(self, action: #selector(withdrawalBtnTapped), for: .touchUpInside)
        
        self.navigationItem.title = "설정"
        
        setUpView()
        setUpConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
    }
    
    func setUpView() {
        
        self.view.addSubview(settingView)
    }
    
    func setUpConstraints() {
        
        settingView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }

    @objc
    func notifBtnTapped() {
        let notificationSettingViewController = NotificationSettingViewController()
            navigationController?.pushViewController(notificationSettingViewController, animated: false)
    }
    
    @objc
    func feedbackBtnTapped() {
        print("피드백화면으로 이동완료!")
    }
    
    @objc
    func reviewBtnTapped() {
        print("앱스토어로 이동완료!")
    }
    
    @objc
    func instagramBtnTapped() {
        print("인스타그램으로 이동완료!")
    }
    
    @objc
    func developerIntroductionBtnTapped() {
        let introduceDeveloperViewController = IntroduceDeveloperViewController()
        navigationController?.pushViewController(introduceDeveloperViewController, animated: false)
    }
    
    @objc
    func withdrawalBtnTapped() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "SFPro-Medium", size: 14)!, NSAttributedString.Key.foregroundColor: UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)]
        let titleString = NSAttributedString(string: "회원탈퇴", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "SFPro-Regular", size: 12)!, NSAttributedString.Key.foregroundColor: UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)]
        let messageString = NSAttributedString(string: "유저 정보와 작성한 행복 기록이 삭제됩니다.", attributes: messageAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.setValue(messageString, forKey: "attributedMessage")
        
        let labelAction = UIAlertAction(title: "탈퇴하기", style: .destructive) { (action) in
            self.withdrawalWithAPI()
            self.navigationController?.pushViewController(LoginViewController(), animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소하기", style: .cancel, handler: nil)
        alert.addAction(labelAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension SettingViewController {
    func withdrawalWithAPI() {
        AuthAPI.shared.withdrawal() { (response) in
            switch response {
            case .success(let withdrawalData):
                // TODO: 최초 실행 시에는 잘 되지만 회원가입 > 탈퇴 > 회원가입 > 탈퇴 시 탈퇴 실패
                UserDefaults.standard.removeObject(forKey: "sessionId")
                UserDefaults.standard.removeObject(forKey: "memberId")
                UserDefaults.standard.removeObject(forKey: "socialType")
            case .requestError(let resultCode, let message):
                print("withdrawalWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("withdrawalWithAPI - pathError")
            case .serverError:
                print("withdrawalWithAPI - serverError")
            case .networkFail:
                print("withdrawalWithAPI - networkFail")
            }
        }
    }
}
