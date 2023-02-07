//
//  BottomSheetView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/02/06.
//

import UIKit
import SnapKit
import Then

class BottomSheetView: UIView {

    var paragraphStyle = NSMutableParagraphStyle()
    
    var dateLblContent = "2023.01.13."
    var dayOfTheWeekLblContent = "금요일"
    var meridiemLblContent = "AM"
    var timeLblContent = "11:30"
    
    var tagLblContent = "tag 1"
    
    var textViewContent = "하나에 어머니 당신은 한 소녀들의 잔디가 하나에 봅니다. 내일 너무나 위에 쉬이 한 버리었습니다. 가을 이 하나 흙으로 지나고 이름을 거외다. 애기 벌레는 써 나는 계십니다. 노루, 멀듯이, 봄이 많은 시와 버리었습니다. 나는 피어나듯이 위에 별을 쉬이 가난한 쓸쓸함과 하나 까닭입니다. 하나에 마리아 둘 이제 그리워 차 내 어머니, 새워 듯합니다. 가난한 추억과 그리워 아침이 소학교 때 무덤 이름과, 북간도에 듯합니다. 속의 묻힌 쉬이 프랑시스 아무 별이 우는 가을로 있습니다. 오는 아침이 밤을 다 피어나듯이 이제 다 있습니다.하나에 어머니 당신은 한 소녀들의 잔디가 하나에 봅니다. 내일 너무나 위에 쉬이 한 버리었습니다. 가을 이 하나 흙으로 지나고 이름을 거외다. 애기 벌레는 써 나는 계십니다. 노루, 멀듯이, 봄이 많은 시와 버리었습니다. 나는 피어나듯이 위에 별을 쉬이 가난한 쓸쓸함과 하나 까닭입니다. 하나에 마리아 둘 이제 그리워 차 내 어머니, 새워 듯합니다. 가난한 추억과 그리워 아침이 소학교 때 무덤 이름과, 북간도에 듯합니다. 속의 묻힌 쉬이 프랑시스 아무 별이 우는 가을로 있습니다. 오는 아침이 밤을 다 피어나듯이 이제 다 있습니다.하나에 어머니 당신은 한 소녀들의 잔디가 하나에 봅니다. 내일 너무나 위에 쉬이 한 버리었습니다. 가을 이 하나 흙으로 지나고 이름을 거외다. 애기 벌레는 써 나는 계십니다. 노루, 멀듯이, 봄이 많은 시와 버리었습니다. 나는 피어나듯이 위에 별을 쉬이 가난한 쓸쓸함과 하나 까닭입니다. 하나에 마리아 둘 이제 그리워 차 내 어머니, 새워 듯합니다. 가난한 추억과 그리워 아침이 소학교 때 무덤 이름과, 북간도에 듯합니다. 속의 묻힌 쉬이 프랑시스 아무 별이 우는 가을로 있습니다. 오는 아침이 밤을 다 피어나듯이 이제 다 있습니다.하나에 어머니 당신은 한 소녀들의 잔디가 하나에 봅니다. 내일 너무나 위에 쉬이 한 버리었습니다. 가을 이 하나 흙으로 지나고 이름을 거외다. 애기 벌레는 써 나는 계십니다. 노루, 멀듯이, 봄이 많은 시와 버리었습니다. 나는 피어나듯이 위에 별을 쉬이 가난한 쓸쓸함과 하나 까닭입니다. 하나에 마리아 둘 이제 그리워 차 내 어머니, 새워 듯합니다. 가난한 추억과 그리워 아침이 소학교 때 무덤 이름과, 북간도에 듯합니다. 속의 묻힌 쉬이 프랑시스 아무 별이 우는 가을로 있습니다. 오는 아침이 밤을 다 피어나듯이 이제 다 있습니다."
    
    let infoContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let dateLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
    }
    
    let dayOfTheWeekLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
    }
    
    let meridiemLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
    }
    
    let timeLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.544, green: 0.55, blue: 0.545, alpha: 1)
        $0.font = UIFont(name: "SFPro-Regular", size: 12)
    }
    
    let tagView = UIView().then {
        $0.layer.cornerRadius = 10 // 원래는 15
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1).cgColor
    }
    
    let tagLbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
    }
    
    let borderView = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    let textView = UITextView().then {
        $0.isEditable = false
        $0.backgroundColor = .white
        $0.tintColor = .black
        $0.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsVerticalScrollIndicator = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
        customLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
        setUpConstraints()
        customLabel()
    }
    
    func setUpView() {
        
        [infoContainerView, textView].forEach {
            addSubview($0)
        }
        [dateLbl, dayOfTheWeekLbl, meridiemLbl, timeLbl, tagView, borderView].forEach {
            infoContainerView.addSubview($0)
        }
        tagView.addSubview(tagLbl)
    }
    
    func setUpConstraints() {
        
        infoContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        dateLbl.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        dayOfTheWeekLbl.snp.makeConstraints {
            $0.centerY.equalTo(dateLbl)
            $0.leading.equalTo(dateLbl.snp.trailing)
        }
        meridiemLbl.snp.makeConstraints {
            $0.centerY.equalTo(dateLbl)
            $0.leading.equalTo(dayOfTheWeekLbl.snp.trailing).offset(4)
        }
        timeLbl.snp.makeConstraints {
            $0.centerY.equalTo(dateLbl)
            $0.leading.equalTo(meridiemLbl.snp.trailing)
        }
        tagView.snp.makeConstraints {
            $0.top.equalTo(dateLbl.snp.bottom).offset(8)
            $0.leading.equalTo(dateLbl)
            $0.height.equalTo(Constant.height * 18)
        }
        tagLbl.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        borderView.snp.makeConstraints {
            $0.top.equalTo(tagView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(Constant.height * 0.5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(borderView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    
    func customLabel() {
        
        paragraphStyle.lineHeightMultiple = 1.34
        
        dateLbl.attributedText = NSMutableAttributedString(string: dateLblContent, attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        dateLbl.font = UIFont(name: "SFPro-Regular", size: 12)
        
        dayOfTheWeekLbl.attributedText = NSMutableAttributedString(string: dayOfTheWeekLblContent, attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        dayOfTheWeekLbl.font = UIFont(name: "SFPro-Regular", size: 12)
        
        meridiemLbl.attributedText = NSMutableAttributedString(string: meridiemLblContent, attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        meridiemLbl.font = UIFont(name: "SFPro-Regular", size: 12)
        
        timeLbl.attributedText = NSMutableAttributedString(string: timeLblContent, attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        timeLbl.font = UIFont(name: "SFPro-Regular", size: 12)
        
        tagLbl.attributedText = NSMutableAttributedString(string: tagLblContent, attributes: [NSAttributedString.Key.kern: 0.03])
        tagLbl.font = UIFont(name: "SFPro-Regular", size: 10)
        
        textView.attributedText = NSMutableAttributedString(string: textViewContent, attributes: [NSAttributedString.Key.kern: 0.04, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        textView.font = UIFont(name: "SFPro-Regular", size: 14)
    }
}
