//
//  WritingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/28.
//

import UIKit
import PhotosUI

class WritingViewController: UIViewController {

    let backgroundView: UIView = {
            let bg = UIView()
            bg.backgroundColor = UIColor(red: 0.956, green: 1, blue: 0.892, alpha: 1)
            bg.layer.cornerRadius = 15
            
            return bg
        }()
        
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "오늘은 어떤 행복한 일이 있었나요?"
        tv.textColor = .lightGray
        tv.font = UIFont(name: "SFPro-Regular", size: 14)
        tv.layer.cornerRadius = 15
        tv.textContainerInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
        
        return tv
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("기록하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "SFPro-Medium", size: 16)
        button.layer.cornerRadius = 13
        
        button.backgroundColor = UIColor(red: 0.743, green: 0.75, blue: 0.743, alpha: 1)
        
        button.isEnabled = false
        button.addTarget(self, action: #selector(submitButtonDidTapped), for: .touchUpInside)
        
        return button
    }()

    let addImage = UIImage(named: "AddImage")
    lazy var images: [UIImage] = [addImage!]
    let maxImageNumber = 5
        
    lazy var imageCollectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
        flowlayout.itemSize = CGSize(width: 108, height: 108)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.backgroundColor = .none
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WritingImageCollectionViewCell.self, forCellWithReuseIdentifier: "WritingImageCollectionViewCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "오늘의 행복"
        setup()
        makeAutoLayout()
        
        textView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    func setup() {
        [backgroundView, imageCollectionView, textView, submitButton].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = .white
        imageCollectionView.frame = view.bounds
        }
    
    func makeAutoLayout() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 104),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -108),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 251),
            textView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 19),
            textView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -19),
            textView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20)
        ])
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.centerXAnchor.constraint(equalTo: textView.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 18),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -37),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -62)
        ])
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageCollectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            imageCollectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 29),
            imageCollectionView.heightAnchor.constraint(equalToConstant: 108)
        ])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func submitButtonDidTapped() {
        images.removeLast()
        print("images: \(images)")
        print("내용: \(textView.text ?? "")")
        
        // TODO: 해시태그 연동하기
        // TODO: 화면 이동 - navigationController pop? push?
        let writingJSON = WritingJSON(contents: textView.text ?? "", tagIds: [])
        createRecordWithAPI(writingJSON: writingJSON, images: images)
        
//        navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonDidTapped() {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        let itemsNumber = self.imageCollectionView.numberOfItems(inSection: 0)
        
        configuration.selectionLimit = maxImageNumber - itemsNumber + 1
        configuration.selection = .ordered
        configuration.filter = .any(of: [.images, .livePhotos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true) // PHPicker을 present 방식으로 띄움
        
    }
}

extension WritingViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let group = DispatchGroup()
        
        var order = [String]()
        var asyncDict = [String: UIImage]()
        
        // 최초로 이미지 추가
        if self.images.count == 1 && results.count != 0 {
            self.imageCollectionView.deleteItems(at: [IndexPath.init(row: 0, section: 0)])
            self.images.remove(at: 0)
        }
        
        for result in results {
            order.append(result.assetIdentifier ?? "")
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                defer {
                    group.leave()
                }
                guard let image = object as? UIImage, error == nil else {
                    return
                }
                
                asyncDict[result.assetIdentifier ?? ""] = image
            }
        }

        group.notify(queue: .main) {
            for id in order {
                if self.images.count == 0 {
                    self.images.append(asyncDict[id]!)
                    self.images.append(self.addImage!)
                } else {
                    self.images.insert(asyncDict[id]!, at: self.images.count - 1)
                }
            }
            self.imageCollectionView.reloadData()
        }
    }
}

extension WritingViewController {
    func createRecordWithAPI(writingJSON: WritingJSON, images: [UIImage]) {
        WritingAPI.shared.createRecord(writingJSON: writingJSON, images: images) { response in
            switch response {
            case .success(let writingData):
                if let data = writingData as? WritingResponse {
                    print("게시물 생성이 완료되었습니다. boardId: \(data.boardId)")
                    print("createRecordWithAPI - success")
                }
            case .requestError(let resultCode, let message):
                print("lcreateRecordWithAPI - requestError: [\(resultCode)] \(message)")
            case .pathError:
                print("createRecordWithAPI - pathError")
            case .serverError:
                print("createRecordWithAPI - serverError")
            case .networkFail:
                print("createRecordWithAPI - networkFail")
            }
        }
    }
}
