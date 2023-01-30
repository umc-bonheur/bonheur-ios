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
        homeTab.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: -40.0, vertical: 0.0)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 12) ?? .systemFont(ofSize: 12)], for: .normal)
        
        cloverButton.frame = CGRect(x: view.bounds.width/2 - 39, y: view.bounds.height - 100, width: 68, height: 68)
        cloverButton.addTarget(self, action: #selector(cloverButtonTapped(_ :)), for: .touchUpInside)
        cloverButton.layer.applyShadow(color: .black, alpha: 0.05, x: 0, y: 4, blur: 15)

        mypageTab = MyPageViewController()
        mypageTab.tabBarItem = UITabBarItem(title: "마이", image: UIImage(named: "TabBarMyPageButton") ?? UIImage(), selectedImage: UIImage(named: "TabBarMyPageButton") ?? UIImage())
        mypageTab.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 40.0, vertical: 0.0)
        mypageTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFPro-Bold", size: 12) ?? .systemFont(ofSize: 12)], for: .normal)
        
        viewControllers = [homeTab, mypageTab]
        
        let tabBarBackgroundImageView = UIImageView(image: UIImage(named: "TabBarCustomBackgroundImage"))
        tabBarBackgroundImageView.frame = self.tabBar.bounds.offsetBy(dx: -5, dy: -10)
        self.tabBar.addSubview(tabBarBackgroundImageView)
        self.tabBar.sendSubviewToBack(tabBarBackgroundImageView)
        
        tabBar.tintColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        UITabBar.clearShadow()
        tabBarBackgroundImageView.layer.applyShadow(color: .black, alpha: 0.05, x: 0, y: -4, blur: 30)
        view.addSubview(cloverButton)
    }
    
    @objc func cloverButtonTapped(_ sender: UIButton) {
        let writingVC = WritingViewController()
                
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        navigationController?.pushViewController(writingVC, animated: true)
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
