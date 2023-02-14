//
//  ProfileSettingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/02/09.
//

import UIKit
import SnapKit
import Then
import MobileCoreServices
import UniformTypeIdentifiers

class ProfileSettingViewController: EditProfileViewController {
    var accessToken = ""
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 16)
        button.layer.cornerRadius = 13
        
        button.backgroundColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)

        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        editProfileView.cameraBtn.addTarget(self, action: #selector(cameraBtnTapped), for: .touchUpInside)
        
        // 네비게이션 바 커스텀
        self.navigationItem.title = "닉네임 설정"
        self.navigationItem.rightBarButtonItem = .none
        
        setUpView()
        setUpConstraints()
        setUpNavBar()
        setUpStartButton()
        
    }
    
    override func setUpView() {
        self.view.addSubview(editProfileView)
        self.view.addSubview(startButton)
    }
    
    @objc func startButtonTapped() {
        let nickname = editProfileView.nickname
        let socialSignUpJSON = SocialSignUpJSON(token: self.accessToken, nickname: nickname, socialType: "카카오")
        
        let profileImage = editProfileView.profileImageView.image
        
        if profileImage == nil { // 기본 프사로 설정
            socialSignUpWithAPI(socialSignUpJSON: socialSignUpJSON, profileImage: nil)
        } else { // 사용자가 선택한 이미지로 프사 설정
            socialSignUpWithAPI(socialSignUpJSON: socialSignUpJSON, profileImage: profileImage!)
        }
    }
    
    func setUpStartButton() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -163),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62),
            startButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}

extension ProfileSettingViewController {
    func socialSignUpWithAPI(socialSignUpJSON: SocialSignUpJSON, profileImage: UIImage?) {
        AuthAPI.shared.socialSignUp(socialSignUpJSON: socialSignUpJSON, profileImage: profileImage) { response in
            switch response {
            case .success(let socialSignUpData):
                if let data = socialSignUpData as? SocialSignUpResponse {
                    UserDefaults.standard.set(socialSignUpJSON.socialType, forKey: Const.UserDefaultsKey.socialType)
                    UserDefaults.standard.set(data.sessionId, forKey: Const.UserDefaultsKey.sessionId)
                    UserDefaults.standard.set(data.memberId, forKey: Const.UserDefaultsKey.memberId)
                    UserDefaults.standard.set(Date(), forKey: Const.UserDefaultsKey.updatedAt)
                    UserDefaults.standard.set(true, forKey: Const.UserDefaultsKey.isLogin)
                    self.navigationController?.pushViewController(TabBarController(), animated: true)
                }
                print("socialSignUpWithAPI - success")
            case .requestError(let resultCode, let message):
                print("socialSignUpWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("socialSignUpWithAPI - pathError")
            case .serverError:
                print("socialSignUpWithAPI - serverError")
            case .networkFail:
                print("socialSignUpWithAPI - networkFail")
            }
        }
    }
}
