//
//  DetailImageViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/06.
//

import UIKit
import SnapKit
import Then

class DetailImageViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    var selectedIndex: Int = 0
    var imageArr: [MyCustomData] = []
    
    fileprivate let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentMode = .scaleAspectFit
        sv.showsVerticalScrollIndicator = false
        sv.showsHorizontalScrollIndicator = false
        sv.backgroundColor = .clear
        sv.minimumZoomScale = 1
        sv.maximumZoomScale = 6
        return sv
    }()
    
    fileprivate let img: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let navigationBarView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    lazy var closeBtn = UIButton()
    
    let closeBtnImageView = UIImageView().then {
        $0.image = UIImage(named: "multiply")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let countLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
        $0.textAlignment = .center
    }
    
    let moreBtnImageView = UIImageView().then {
        
        $0.image = UIImage(named: "more")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var shareBtn = UIButton()
    
    let shareBtnImageView = UIImageView().then {
        
        $0.image = UIImage(named: "share")
        $0.contentMode = .center
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func closeBtnTapped() {
        self.dismissView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        scrollView.delegate = self
        
        closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
        
        setupGesture()
        setUpView()
        setUpConstraints()
        loadImage()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setUpView() {
        [scrollView, navigationBarView].forEach {
            view.addSubview($0)
        }
        [countLbl, closeBtn, shareBtn].forEach {
            navigationBarView.addSubview($0)
        }
        scrollView.addSubview(img)
        shareBtn.addSubview(shareBtnImageView)
        closeBtn.addSubview(closeBtnImageView)
    }
    
    func setUpConstraints() {
        
        scrollView.frame = view.bounds
        img.frame = scrollView.bounds
        
        navigationBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constant.height * 44)
        }
        closeBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15.41)
            $0.leading.equalToSuperview().offset(17.41)
            $0.centerY.equalTo(countLbl)
        }
        closeBtnImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        countLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.centerX.equalToSuperview()
        }
        shareBtn.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(11.1)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(countLbl)
        }
        shareBtnImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupGesture() {
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTapOnScrollView(recognizer:)))
        singleTapGesture.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(singleTapGesture)
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapOnScrollView(recognizer:)))
        doubleTapGesture.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGesture)
        
        singleTapGesture.require(toFail: doubleTapGesture)
        
        let rightSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeFrom(recognizer:)))
        let leftSwipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeFrom(recognizer:)))
        
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        
        scrollView.addGestureRecognizer(rightSwipe)
        scrollView.addGestureRecognizer(leftSwipe)
    }
    
    func loadImage() {
        img.image = imageArr[selectedIndex].image
        countLbl.text = String(format: "%ld / %ld", selectedIndex + 1, imageArr.count)
    }
    
    @objc func handleSingleTapOnScrollView(recognizer: UITapGestureRecognizer) {
        if closeBtn.isHidden {
            closeBtn.isHidden = false
            countLbl.isHidden = false
        } else {
            closeBtn.isHidden = true
            countLbl.isHidden = true
        }
    }
    
    @objc func handleDoubleTapOnScrollView(recognizer: UITapGestureRecognizer) {
        if scrollView.zoomScale == 1 {
            scrollView.zoom(to: zoomRectForScale(scale: scrollView.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
            closeBtn.isHidden = true
            countLbl.isHidden = true
        } else {
            scrollView.setZoomScale(1, animated: true)
            closeBtn.isHidden = false
            countLbl.isHidden = false
        }
    }
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = img.frame.size.height / scale
        zoomRect.size.width  = img.frame.size.width  / scale
        let newCenter = img.convert(center, from: scrollView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return img
    }
    
    @objc func handleSwipeFrom(recognizer: UISwipeGestureRecognizer) {
        let direction: UISwipeGestureRecognizer.Direction = recognizer.direction
        
        switch direction {
        case UISwipeGestureRecognizer.Direction.right:
            self.selectedIndex -= 1
            
        case UISwipeGestureRecognizer.Direction.left:
            self.selectedIndex += 1
        
        default:
            break
        }
        self.selectedIndex = (self.selectedIndex < 0) ? (self.imageArr.count - 1):
            self.selectedIndex % self.imageArr.count
        
        loadImage()
        
    }
    
    @objc func handlePinch(recognizer: UIPinchGestureRecognizer) {
        print(recognizer)
        recognizer.view?.transform = (recognizer.view?.transform.scaledBy(x: recognizer.scale, y: recognizer.scale))!
        recognizer.scale = 1
        img.contentMode = .scaleAspectFit
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > 1 {
            if let image = img.image {
                let ratioW = img.frame.width / image.size.width
                let ratioH = img.frame.height / image.size.height
                
                let ratio = ratioW < ratioH ? ratioW:ratioH
                let newWidth = image.size.width*ratio
                let newHeight = image.size.height*ratio
                
                let left = 0.5 * (newWidth * scrollView.zoomScale > img.frame.width ? (newWidth - img.frame.width) : (scrollView.frame.width - scrollView.contentSize.width))
                let top = 0.5 * (newHeight * scrollView.zoomScale > img.frame.height ? (newHeight - img.frame.height) : (scrollView.frame.height - scrollView.contentSize.height))

                scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: top, right: left)
            }
        } else {
            scrollView.contentInset = UIEdgeInsets.zero
        }
    }
}
