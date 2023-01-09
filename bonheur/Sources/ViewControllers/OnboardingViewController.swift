//
//  OnboardingViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit

class OnboardingViewController: UIViewController {

    let mainLabel = UILabel()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 폰트 두껍게 20
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    func setup() {
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)  // 화면에 표시되게 만듦
        view.addSubview(backButton)
        
        view.backgroundColor = .white
    }
    
    
    func makeAutoLayout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false // 자동적으로 할당된 오토레이아웃 해제
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false // 자동적으로 할당된 오토레이아웃 해제
        backButton.widthAnchor.constraint (equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint (equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint (equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil) // 전 화면으로 돌아가기
    }

}
