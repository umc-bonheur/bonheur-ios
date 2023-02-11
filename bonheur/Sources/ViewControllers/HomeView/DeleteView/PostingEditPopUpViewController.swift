//
//  PostingEditPopUpViewController.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

class PostingEditPopUpViewController: UIViewController {
//    private let postingEditPopUpView = PostingEditPopUpView()
    private let postingDeletePopUpView = PostingDeletePopUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.layer.backgroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 0.4).cgColor

//        postingEditPopUpView.postingDeleteButton.addTarget(self, action: #selector(self.postingDeleteButtonTapped), for: .touchUpInside)
//
        [postingDeletePopUpView].forEach {
            view.addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
//        postingEditPopUpView.translatesAutoresizingMaskIntoConstraints = false
        postingDeletePopUpView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            postingEditPopUpView.topAnchor.constraint(equalTo: view.topAnchor),
//            postingEditPopUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            postingEditPopUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
//            postingEditPopUpView.heightAnchor.constraint(equalTo: view.heightAnchor),
//
            postingDeletePopUpView.topAnchor.constraint(equalTo: view.topAnchor),
            postingDeletePopUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postingDeletePopUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postingDeletePopUpView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    @objc func postingDeleteButtonTapped() {
        // 기존의 view 지우고 delete view 띄우기
        // 정보 전달하기
        
    }
}
