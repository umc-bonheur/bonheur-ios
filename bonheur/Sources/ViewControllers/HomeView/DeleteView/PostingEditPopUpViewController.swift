//
//  PostingEditPopUpViewController.swift
//  bonheur
//
//  Created by 김소현 on 2023/02/07.
//

import UIKit

class PostingEditPopUpViewController: UIViewController {
    private let postingEditPopUpView = PostingEditPopUpView()
    private let postingDeletePopUpView = PostingDeletePopUpView()
    private let deleteCompletionView = DeleteCompletionView()
    // observable Bool로 화면 변환 처리

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.layer.backgroundColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 0.4).cgColor

        postingEditPopUpView.postingDeleteButton.addTarget(self, action: #selector(self.postingDeleteButtonTapped), for: .touchUpInside)
        postingDeletePopUpView.popUpDeleteButton.addTarget(self, action: #selector(self.popUpDeleteButtonTapped), for: .touchUpInside)
        postingDeletePopUpView.popUpCancelButton.addTarget(self, action: #selector(self.popUpCancelButtonTapped), for: .touchUpInside)

        [postingEditPopUpView, postingDeletePopUpView, deleteCompletionView].forEach {
            view.addSubview($0)
        }
        
        setConstraints()
    }
    
    private func setConstraints() {
        postingEditPopUpView.translatesAutoresizingMaskIntoConstraints = false
        postingDeletePopUpView.translatesAutoresizingMaskIntoConstraints = false
        deleteCompletionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // TODO: 화면 변환 로직 구현하기
            postingEditPopUpView.topAnchor.constraint(equalTo: view.topAnchor),
            postingEditPopUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postingEditPopUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postingEditPopUpView.heightAnchor.constraint(equalTo: view.heightAnchor),

            postingDeletePopUpView.topAnchor.constraint(equalTo: view.topAnchor),
            postingDeletePopUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postingDeletePopUpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postingDeletePopUpView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            deleteCompletionView.topAnchor.constraint(equalTo: view.topAnchor),
            deleteCompletionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteCompletionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            deleteCompletionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    @objc func postingDeleteButtonTapped() {
        // cell data 전달하기
        
    }
    
    @objc func popUpDeleteButtonTapped() {
        
    }
    
    @objc func popUpCancelButtonTapped() {
        
    }
}
