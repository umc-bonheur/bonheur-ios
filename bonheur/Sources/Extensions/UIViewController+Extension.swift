//
//  UIViewController+Extension.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import Foundation
import UIKit

extension UIViewController {
    
    // 네비게이션 바 커스텀
    func setUpNavBar() {
        let backButton = UIBarButtonItem()
        backButton.tintColor = .black
        backButton.width = 30
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SFPro-Medium", size: 16)!]
    }
    
    // collectionView의 Cell에서 다른 viewController로 이동
    func pushView(viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.15
        transition.type = .fade
        self.view.window?.layer.add(transition, forKey: kCATransition)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
    }
    
    func dismissView() {
        let transition = CATransition()
        transition.duration = 0.15
        transition.type = .fade
        transition.subtype = .none
        self.view.window?.layer.add(transition, forKey: kCATransition)
        self.dismiss(animated: true)
    }
}
