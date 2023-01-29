//
//  MyPageViewController.swift
//  bonheur
//
//  Created by 이정연 on 2023/01/09.
//

import UIKit

class MyPageViewController: UIViewController {

    let mainLabel = UILabel()
    
    // test

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        makeAutoLayout()
    }
    
    func setup() {
        mainLabel.text = "Sarang's page"
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)  // 화면에 표시되게 만듦
        view.backgroundColor = .white
    }
    
    
    func makeAutoLayout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false // 자동적으로 할당된 오토레이아웃 해제
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    

}
