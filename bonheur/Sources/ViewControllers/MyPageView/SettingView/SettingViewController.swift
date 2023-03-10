//
//  SettingViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then
import SafariServices

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
        settingView.privacyPolicyBtn.addTarget(self, action: #selector(privacyPolicyBtnTapped), for: .touchUpInside)
        settingView.termsOfServiceBtn.addTarget(self, action: #selector(termsOfServiceBtnTapped), for: .touchUpInside)
        
        // 로그아웃
        settingView.logOutBtn.addTarget(self, action: #selector(logOutBtnTapped), for: .touchUpInside)
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
        guard let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSfFVRiM67jVKXu4hmf7oXpVP0dWWxiaukXR6vqiWyMTLeSDUQ/viewform") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc
    func reviewBtnTapped() {
        guard let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSepDeicpqyHDMmbVqxeN7nKpauULogase2k6Xqp_h1Q35DGyA/viewform") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc
    func instagramBtnTapped() {
        guard let url = URL(string: "https://www.instagram.com/bonheur.team/?igshid=MDM4ZDc5MmU%3D") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc
    func developerIntroductionBtnTapped() {
        let introduceDeveloperViewController = IntroduceDeveloperViewController()
        navigationController?.pushViewController(introduceDeveloperViewController, animated: false)
    }
    
    @objc
    func privacyPolicyBtnTapped() {
        guard let url = URL(string: "https://bonheur-develop.notion.site/bff43db7d5344a4383d65a0733e1a659") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc
    func termsOfServiceBtnTapped() {
        guard let url = URL(string: "https://bonheur-develop.notion.site/8fb32e70b8d0400da7ca419a07cc177b") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc
    func logOutBtnTapped() {
        self.logoutWithAPI()
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
        }
        let cancelAction = UIAlertAction(title: "취소하기", style: .cancel, handler: nil)
        alert.addAction(labelAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension SettingViewController {
    func logoutWithAPI() {
        AuthAPI.shared.logout() { (response) in
            switch response {
            case .success(let logoutData):
                UserDefaults.standard.set(false, forKey: Const.UserDefaultsKey.isLogin)
                self.navigationController?.popToRootViewController(animated: true)
                print("logoutWithAPI - success")
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
    func withdrawalWithAPI() {
        AuthAPI.shared.withdrawal() { (response) in
            switch response {
            case .success(let withdrawalData):
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.socialType)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.accessToken)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.sessionId)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.updatedAt)
                UserDefaults.standard.removeObject(forKey: Const.UserDefaultsKey.memberId)
                UserDefaults.standard.set(false, forKey: Const.UserDefaultsKey.isLogin)
                self.navigationController?.popToRootViewController(animated: true)
                print("withdrawalWithAPI - success")
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
