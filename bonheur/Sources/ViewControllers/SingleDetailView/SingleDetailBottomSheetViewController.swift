//
//  SingleDetailBottomSheetViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/06.
//

import UIKit
import SnapKit
import Then

class SingleDetailBottomSheetViewController: UIViewController {

    let bottomSheetView = BottomSheetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
        
        bottomSheetView.backgroundColor = .white
    }
    
    func setUpView() {
        
        self.view.addSubview(bottomSheetView)
    }
    
    func setUpConstraints() {
        
        bottomSheetView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
