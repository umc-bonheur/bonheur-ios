//
//  NavigationController.swift
//  bonheur
//
//  Created by Rocky on 2023/01/13.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
      }
    
    
    
//    navigationController?.navigationBar.tintColor = .blue
//    navigationController?.navigationBar.standardAppearance = appearance
//    navigationController?.navigationBar.compactAppearance = appearance
//    navigationController?.navigationBar.scrollEdgeAppearance = appearance

}
