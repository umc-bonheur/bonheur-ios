//
//  FloatingPanelController+Extension.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/06.
//

import Foundation
import UIKit
import FloatingPanel

extension SingleDetailViewController {
    
    func setUpFloatingPanel() {
        floatingPanelController = FloatingPanelController()
        floatingPanelController.changePanelStyle() // 스타일 변경
        floatingPanelController.delegate = self
        floatingPanelController.set(contentViewController: singleDetailbottomSheetViewController) // floatingPanelController에 삽입할 것
        floatingPanelController.track(scrollView: singleDetailbottomSheetViewController.bottomSheetView.textView)
        floatingPanelController.addPanel(toParent: self) // floatingPanelController를 관리하는 UIViewController
        floatingPanelController.layout = MyFloatingPanelLayout()
        floatingPanelController.invalidateLayout()
    }
    
//    func floatingPanelDidChangePosition(_ fpc: FloatingPanelController) {
//        if fpc.state == .full {
//        } else { }
//    }
}

extension FloatingPanelController {
    func changePanelStyle() {
        let appearance = SurfaceAppearance()
        appearance.cornerRadius = 15.0
        appearance.backgroundColor = .clear
        appearance.borderColor = .white
        appearance.borderWidth = 0
        surfaceView.grabberHandle.isHidden = true
        surfaceView.appearance = appearance
    }
}

class MyFloatingPanelLayout: FloatingPanelLayout {

    var position: FloatingPanelPosition {
        return .bottom
    }

    var initialState: FloatingPanelState {
        return .half
    }

    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] { // 가능한 floating panel: 현재 full, half만 가능하게 설정
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 100.0, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.49, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
}
