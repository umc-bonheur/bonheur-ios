//
//  SingleDetailViewController.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/06.
//

import UIKit
import SnapKit
import Then
import FloatingPanel

struct MyCustomData {
    var image = UIImage()
}

struct SingleDetailImage {
    static let image1: UIImage = UIImage(named: "image1")!
    static let image2: UIImage = UIImage(named: "image2")!
}

class SingleDetailViewController: UIViewController, FloatingPanelControllerDelegate {
    
    fileprivate let data = [
        MyCustomData(image: SingleDetailImage.image1),
        MyCustomData(image: SingleDetailImage.image2),
        MyCustomData(image: SingleDetailImage.image1),
        MyCustomData(image: SingleDetailImage.image2)
    ]
    
    private enum Const {
        static let itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        static let itemSpacing = 0.0
        static var insetX: CGFloat {
          (UIScreen.main.bounds.width - Self.itemSize.width) / 2.0
        }
        static var collectionViewContentInset: UIEdgeInsets {
        UIEdgeInsets(top: 0, left: Self.insetX, bottom: 0, right: Self.insetX)
      }
    }
    
//    var imageArr: [String] = ["image", "image2", "guemin"]
    
    lazy var backBtn = UIButton().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        $0.layer.cornerRadius = 5
    }
    
    let backBtnImageView = UIImageView().then {
        $0.image = UIImage(named: "arrow-left")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var moreBtn = UIButton().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        $0.layer.cornerRadius = 5
    }
    
    let moreBtnImageView = UIImageView().then {
        $0.image = UIImage(named: "more")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    lazy var shareBtn = UIButton().then {
        $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
        $0.layer.cornerRadius = 5
    }
    
    let shareBtnImageView = UIImageView().then {
        $0.image = UIImage(named: "share")
        $0.contentMode = .center
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let pageControl = UIPageControl().then {
        $0.currentPage = 0
        $0.pageIndicatorTintColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        $0.currentPageIndicatorTintColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
    }
    
    var singleDetailCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(SingleDetailCollectionViewCell.self,
                                forCellWithReuseIdentifier: SingleDetailCollectionViewCell.identifier)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = false
        cv.decelerationRate = .fast
        return cv
        }()
    
    var floatingPanelController: FloatingPanelController!
    let singleDetailbottomSheetViewController = SingleDetailBottomSheetViewController() // 띄울 VC
    let bottomSheetView = BottomSheetView()
    let cell = SingleDetailCollectionViewCell()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        singleDetailCollectionView.delegate = self
        singleDetailCollectionView.dataSource = self
        
        pageControl.numberOfPages = data.count
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(pageDidChanged(sender:)), for: .valueChanged)
        
        setUpView()
        setUpConstraints()
    }

    func setUpView() {
        
        [singleDetailCollectionView, backBtn, moreBtn, shareBtn, pageControl].forEach {
            view.addSubview($0)
        }
        backBtn.addSubview(backBtnImageView)
        moreBtn.addSubview(moreBtnImageView)
        shareBtn.addSubview(shareBtnImageView)
        
        // floatingPanelController
        moveToBottomSheetViewController()
        setUpFloatingPanel()
    }
    
    func setUpConstraints() {
        
        // 가로길이에 맞추어 정사각형 만들기
        singleDetailCollectionView.heightAnchor.constraint(equalTo: singleDetailCollectionView.widthAnchor, multiplier: 1.0/1.0).isActive = true

        backBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.equalToSuperview().offset(8)
            $0.height.equalTo(Constant.height * 32)
            $0.width.equalTo(Constant.width * 32)
        }
        backBtnImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(6.52)
            $0.center.equalToSuperview()
        }
        moreBtn.snp.makeConstraints {
            
            $0.centerY.equalTo(backBtn)
            $0.trailing.equalTo(shareBtn.snp.leading).offset(-8)
            $0.height.width.equalTo(backBtn)
        }
        moreBtnImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.center.equalToSuperview()
        }
        shareBtn.snp.makeConstraints {
            $0.centerY.equalTo(backBtn)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.width.equalTo(backBtn)
        }
        shareBtnImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.center.equalToSuperview()
        }
        singleDetailCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        pageControl.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalTo(singleDetailCollectionView.snp.bottom).offset(8)
            $0.height.equalTo(Constant.height * 7)
        }
    }
    
    // MARK: imageView Clicked
    @objc func imageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let detailImageViewController = DetailImageViewController()
        detailImageViewController.modalPresentationStyle = .fullScreen
        self.present(detailImageViewController, animated: true, completion: nil)
    }
    
    @objc
    func pageDidChanged(sender: UIPageControl) {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        singleDetailCollectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
    
    @objc
    func backBtnTapped() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc
    func moveToBottomSheetViewController() {
        self.present(singleDetailbottomSheetViewController, animated: true, completion: nil)
    }
    
    @objc
    func pageChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        singleDetailCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
}

class Custom1PageControl: UIPageControl {

    var borderColor: UIColor = .clear

    override var currentPage: Int {
        didSet {
            updateBorderColor()
        }
    }

    func updateBorderColor() {
        subviews.enumerated().forEach { index, subview in
            if index != currentPage {
                subview.layer.borderColor = borderColor.cgColor
                subview.layer.borderWidth = 1
            } else {
                subview.layer.borderWidth = 0
            }
        }
    }
}

extension SingleDetailViewController: UIScrollViewDelegate {
    
    // 이미지 스크롤시 pageControl 클릭 시
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.frame.size.width > 0 else { return } // runtime error 방지 (에러 사유: scollView의 너비가 0이고 0으로 나누려고 할 때 초기화 중에 이 메서드가 호출되기 때문에)
        let width = scrollView.bounds.size.width
        let x = scrollView.contentOffset.x + (width/2) // 좌표보정을 위해 절반의 너비를 더해줌
        let newPage = Int((x/width))
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}

extension SingleDetailViewController: UICollectionViewDelegateFlowLayout {
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return singleDetailCollectionView.bounds.size
    }
    
    func scrollViewWillEndDragging(
      _ scrollView: UIScrollView,
      withVelocity velocity: CGPoint,
      targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
      let scrolledOffsetX = targetContentOffset.pointee.x + scrollView.contentInset.left
      let cellWidth = Const.itemSize.width + Const.itemSpacing
      let index = round(scrolledOffsetX / cellWidth)
      targetContentOffset.pointee = CGPoint(x: index * cellWidth - scrollView.contentInset.left, y: scrollView.contentInset.top)
    }
}

extension SingleDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailImageViewController = DetailImageViewController()
        detailImageViewController.selectedIndex = indexPath.row
        detailImageViewController.imageArr = data
        pushView(viewController: detailImageViewController)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleDetailCollectionViewCell.identifier, for: indexPath) as? SingleDetailCollectionViewCell
        else { return UICollectionViewCell() }
        cell.data = data[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.clipsToBounds = true
        return cell
    }
}

class SingleDetailCollectionViewCell: UICollectionViewCell {

    static let identifier: String = "SingleDetailCollectionViewCell"
    
    let baseView = UIView().then {
        $0.backgroundColor = .clear
    }

    var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true // 이미지 튀어나오는 이슈 방지
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpView()
        setUpConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: MyCustomData? {
        didSet {
            guard let data = data else { return }
            imageView.image = data.image
        }
    }

    func setUpView() {
        self.contentView.addSubview(baseView)
        baseView.addSubview(imageView)
    }

    func setUpConstraint() {

        baseView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
