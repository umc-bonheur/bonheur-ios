//
//  UIViewController+Extension.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/01.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBackButton(_ sender: UIImage? = nil) {
        if sender == nil {
            let backButtonSpacer = UIBarButtonItem()
            backButtonSpacer.width = -28
            let backButton = UIBarButtonItem(image: UIImage(named: "chevron.left")?.withRenderingMode(.alwaysOriginal),
                                             style: .plain,
                                             target: self,
                                             action: #selector(didTapBackButton))
            navigationItem.setLeftBarButtonItems([backButtonSpacer, backButton], animated: false)
        } else {
            let senderImageItem = UIBarButtonItem(image: sender?.resize(newWidth: 10.84).withTintColor(.black, renderingMode: .alwaysOriginal),
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(didTapBackButton))

            navigationItem.setLeftBarButtonItems([senderImageItem], animated: false)
        }
    }
    
    @objc
    func didTapBackButton() {
            navigationController?.popViewController(animated: false)
            tabBarController?.selectedIndex = 0
    }
}
