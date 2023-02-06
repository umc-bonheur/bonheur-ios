//
//  EditProfileViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then
import MobileCoreServices
import UniformTypeIdentifiers

class EditProfileViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    let editProfileView = EditProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        editProfileView.cameraBtn.addTarget(self, action: #selector(cameraBtnTapped), for: .touchUpInside)
        
        // 네비게이션 바 커스텀
        self.navigationItem.title = "프로필 수정"
        
        setUpView()
        setUpConstraints()
        setUpNavBar()
        setUpDoneBtn()
    }
    
    func setUpView() {
        self.view.addSubview(editProfileView)
    }
    
    func setUpConstraints() {
        editProfileView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func setUpDoneBtn() {
        let doneLlb = UILabel()
        doneLlb.text = "완료"
        doneLlb.textColor = .black
        navigationItem.setRightBarButton(UIBarButtonItem(customView: doneLlb), animated: false)
        
        // 제스처인식기 생성
        let doneLblTappedRecognizer = UITapGestureRecognizer(target: self, action: #selector(doneLblTapped(tapGestureRecognizer:)))
        // 상호작용 설정
        doneLlb.isUserInteractionEnabled = true
        // 제스처인식기 연결
        doneLlb.addGestureRecognizer(doneLblTappedRecognizer)
    }
    
    @objc
    func editNicknameBtnTapped() {
        let EditProfileViewController = EditProfileViewController()
        navigationController?.pushViewController(EditProfileViewController, animated: false)
    }
    
    func actionSheet() {
        let alert = UIAlertController(title: "이미지 선택하기", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "사진 찍기", style: .default, handler: {_ in self.openCamera()}))
        alert.addAction(UIAlertAction(title: "라이브러리에서 선택", style: .default, handler: {_ in self.openGallery()}))
        alert.addAction(UIAlertAction(title: "현재 사진 삭제", style: .destructive, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "취소하기", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [kUTTypeImage as String]
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true, completion: nil)
        }
    }
    
    @objc
    func cameraBtnTapped() {
        actionSheet()
    }
    
    //MARK: doneLbl Clicked
    @objc func doneLblTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        uploadBtnTapped()
    }

    func uploadBtnTapped() {
        print("수정이 완료되었습니다.")
    }
}

extension EditProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        let data = convertFromUIImageToDict(info)
        if let editingImage = data[convertInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage{
            print(editingImage)
            editProfileView.profileImageView.image = editingImage
            print("이미지 가져오기 성공")
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func convertFromUIImageToDict(_ input: [UIImagePickerController.InfoKey : Any]) -> [String : Any] {
        return Dictionary(uniqueKeysWithValues: input.map({key, value in (key.rawValue, value)}))
    }

    func convertInfoKey(_ input : UIImagePickerController.InfoKey) -> String{
        return input.rawValue
    }
}
