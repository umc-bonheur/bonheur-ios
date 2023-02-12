//
//  EditProfileView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then

class EditProfileView: UIView, UITextFieldDelegate {
    
    private let frameView = UIView().then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let profileFrameView = UIView().then {
        $0.backgroundColor = UIColor(named: "main-light")
        $0.layer.cornerRadius = 116 / 2.0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let profileCloverImageView = UIImageView().then {
        $0.image = UIImage(named: "profile-clover")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let profileImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 116 / 2.0
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var cameraBtn = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    let cameraFrameView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
        $0.layer.cornerRadius = 44 / 2.0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let cameraImageView = UIImageView().then {
        $0.image = UIImage(named: "camera")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let nicknameLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.textAlignment = .center
    }

    let nicknameTextField = UITextField().then {
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.tintColor = .black
    }
    
    var nickname = ""
    
    lazy var textFieldBorderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
        setUpConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true) // 화면을 터치 시 키보드 내리기
    }
    
    func setUpView() {
        
        nicknameTextField.delegate = self
        textFieldDidBeginEditing(nicknameTextField)
        textFieldDidEndEditing(nicknameTextField)
        
        [frameView, nicknameLbl, nicknameTextField, textFieldBorderView].forEach {
            addSubview($0)
        }
        [profileFrameView, profileImageView, cameraFrameView, textFieldBorderView].forEach {
            frameView.addSubview($0)
        }
        profileFrameView.addSubview(self.profileCloverImageView)
        cameraFrameView.addSubview(self.cameraBtn)
        cameraFrameView.addSubview(self.cameraImageView)
    }
    
    func setUpConstraints() {
        
        nicknameTextField.addLeftPadding()
        
        frameView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(29)
        }
        profileFrameView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        profileCloverImageView.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 79)
            $0.width.equalTo(Constant.width * 79)
            $0.center.equalToSuperview()
            $0.top.bottom.leading.trailing.equalToSuperview().inset(19)
        }
        profileImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        cameraFrameView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().inset(1)
        }
        cameraBtn.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        cameraImageView.snp.makeConstraints {
            $0.height.equalTo(Constant.height * 18)
            $0.width.equalTo(Constant.width * 20)
            $0.center.equalToSuperview()
            $0.top.bottom.leading.trailing.equalToSuperview().inset(12)
        }
        nicknameLbl.snp.makeConstraints {
            $0.top.equalTo(profileFrameView.snp.bottom).offset(67)
            $0.leading.equalToSuperview().inset(33)
        }
        nicknameTextField.snp.makeConstraints {
            $0.centerY.equalTo(nicknameLbl)
            $0.leading.equalTo(nicknameLbl.snp.trailing).offset(20)
            $0.trailing.equalToSuperview().inset(36)
            $0.height.equalTo(Constant.height * 19)
            $0.width.equalTo(Constant.width * 241)
        }
        textFieldBorderView.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(3)
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(nicknameTextField)
        }
    }
    
    // MARK: textField Custom
    @objc func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil // 초기 탭 시, 텍스트필드 비우기
    }
    
    @objc func textFieldDidEndEditing(_ textField: UITextField) {
        textField.attributedPlaceholder = NSAttributedString(
            string: "닉네임은 한글 7자 이내로 입력해주세요",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)]
        )
        nickname = textField.text ?? ""
    }
}

// MARK: Add textField left padding
extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
