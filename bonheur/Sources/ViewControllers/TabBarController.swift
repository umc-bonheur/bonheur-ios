//
//  TabBarController.swift
//  bonheur
//
//  Created by 김소현 on 2023/01/20.
//

import UIKit

class TabBarController: UITabBarController {
    var homeTab: HomeViewController!
    var mypageTab: MyPageViewController!
    
    private let cloverButton: UIButton = {
        let button: UIButton = UIButton(frame: .zero)
        button.setImage(UIImage(named: "TabBarCloverButton"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        homeTab = HomeViewController()
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "TabBarHomeButton") ?? UIImage(), selectedImage: UIImage(named: "TabBarHomeButton") ?? UIImage())
        
        cloverButton.frame = CGRect(x: view.bounds.width/2 - 28.5, y: view.bounds.height - 100, width: view.bounds.width * 0.152, height: view.bounds.width * 0.152)
        cloverButton.addTarget(self, action: #selector(cloverButtonTapped(_ :)), for: .touchUpInside)
        cloverButton.layer.applyShadow(color: .black, alpha: 0.05, x: 0, y: 4, blur: 15)

        mypageTab = MyPageViewController()
        mypageTab.tabBarItem = UITabBarItem(title: "마이", image: UIImage(named: "TabBarMyPageButton") ?? UIImage(), selectedImage: UIImage(named: "TabBarMyPageButton") ?? UIImage())
        
        viewControllers = [homeTab, mypageTab]
        tabBar.tintColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .black, alpha: 0.05, x: 0, y: -4, blur: 30)
        view.addSubview(cloverButton)
    }
    
    @objc func cloverButtonTapped(_ sender: UIButton) {
        // TODO: 카메라 관련 뷰 PUSH
        
    }
}

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = 5
    }
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
