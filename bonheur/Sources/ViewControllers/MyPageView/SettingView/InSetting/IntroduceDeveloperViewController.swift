//
//  IntroduceDeveloperViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit
import SnapKit
import Then

class IntroduceDeveloperViewController: UIViewController {
    
    let introduceDeveloperView = IntroduceDeveloperView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        self.view.addSubview(introduceDeveloperView)
    }
    
    func setUpConstraints() {
        
        introduceDeveloperView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
