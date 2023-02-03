//
//  StatsByTagView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then
import Charts

class StatsByTagView: PieChartView {
    
    var paragraphStyle = NSMutableParagraphStyle()

    let titleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "태그별 통계", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1)
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
    }
    
    let mainView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    
    var stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    let rankingView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var rankingStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .clear
    }
    
    // MARK: Top 1
    let top1View = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let top1Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let tag1Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let countTag1Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let border1View = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // MARK: Top 2
    let top2View = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let top2Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let tag2Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.248, green: 0.25, blue: 0.248, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let countTag2Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let border2View = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // MARK: Top 3
    let top3View = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let top3Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let tag3Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.248, green: 0.25, blue: 0.248, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }

    let countTag3Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let border3View = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // MARK: Top 4
    let top4View = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let top4Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let tag4Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.248, green: 0.25, blue: 0.248, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let countTag4Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let border4View = UIView().then {
        $0.backgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.941, alpha: 1)
    }
    
    // MARK: Top 5
    let top5View = UIView().then {
        $0.backgroundColor = .clear
    }
    
    let top5Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let tag5Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.248, green: 0.25, blue: 0.248, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let countTag5Lbl = UILabel().then {
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFR", size: 12)
    }
    
    let pieChartView = PieChartView()
    
    var daysOfTheWeek = ["태그1", "태그2", "태그3", "태그4", "태그5"]
    let unitsRecorded = [130.0, 24.0, 11.0, 7.0, 5.0]

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
            
        addSubview(titleLbl)
        addSubview(mainView)
        mainView.addSubview(stackView)
        stackView.addArrangedSubview(pieChartView)
        stackView.addArrangedSubview(rankingView)
        rankingView.addSubview(rankingStackView)
        
        [top1View, border1View, top2View, border2View, top3View, border3View, top4View, border4View, top5View].forEach {
            rankingStackView.addArrangedSubview($0)
        }
        [top1Lbl, tag1Lbl, countTag1Lbl].forEach {
            top1View.addSubview($0)
        }
        [top2Lbl, tag2Lbl, countTag2Lbl].forEach {
            top2View.addSubview($0)
        }
        [top3Lbl, tag3Lbl, countTag3Lbl].forEach {
            top3View.addSubview($0)
        }
        [top4Lbl, tag4Lbl, countTag4Lbl].forEach {
            top4View.addSubview($0)
        }
        [top5Lbl, tag5Lbl, countTag5Lbl].forEach {
            top5View.addSubview($0)
        }
        setChart(dataPoints: daysOfTheWeek, values: unitsRecorded)
    }

    func setUpConstraints() {
        
        setUpRankingStackViewConstraints()
        
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(16)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(22)
        }
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(23)
            $0.leading.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().inset(14)
        }
        rankingView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(pieChartView.snp.trailing)
        }
        rankingStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        pieChartView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.height.equalTo(Constant.height * 130)
        }
    }
    
    func setUpRankingStackViewConstraints() {
        
        // Top 1
        top1View.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        top1Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        tag1Lbl.snp.makeConstraints {
            $0.leading.equalTo(top1Lbl.snp.trailing).offset(12)
            $0.centerY.equalTo(top1Lbl)
        }
        countTag1Lbl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(top1Lbl)
        }
        border1View.snp.makeConstraints {
            $0.top.equalTo(top1View.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(top1View)
            $0.height.equalTo(Constant.height * 0.5)
        }
        
        // Top 2
        top2View.snp.makeConstraints {
            $0.top.equalTo(border1View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        top2Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        tag2Lbl.snp.makeConstraints {
            $0.leading.equalTo(top2Lbl.snp.trailing).offset(12)
            $0.centerY.equalTo(top2Lbl)
        }
        countTag2Lbl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(top2Lbl)
        }
        border2View.snp.makeConstraints {
            $0.top.equalTo(top2View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constant.height * 0.5)
        }
        
        // Top 3
        top3View.snp.makeConstraints {
            $0.top.equalTo(border2View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        top3Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        tag3Lbl.snp.makeConstraints {
            $0.leading.equalTo(top3Lbl.snp.trailing).offset(12)
            $0.centerY.equalTo(top3Lbl)
        }
        countTag3Lbl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(top3Lbl)
        }
        border3View.snp.makeConstraints {
            $0.top.equalTo(top3View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constant.height * 0.5)
        }
        
        // top 4
        top4View.snp.makeConstraints {
            $0.top.equalTo(border3View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        top4Lbl.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
        }
        tag4Lbl.snp.makeConstraints {
            $0.leading.equalTo(top4Lbl.snp.trailing).offset(12)
            $0.centerY.equalTo(top4Lbl)
        }
        countTag4Lbl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(top4Lbl)
        }
        border4View.snp.makeConstraints {
            $0.top.equalTo(top4View.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constant.height * 0.5)
        }
        
        // Top 5
        top5View.snp.makeConstraints {
            $0.top.equalTo(border4View.snp.bottom).offset(4)
            $0.bottom.equalToSuperview().inset(8)
            $0.leading.trailing.equalToSuperview()
        }
        top5Lbl.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        tag5Lbl.snp.makeConstraints {
            $0.leading.equalTo(top5Lbl.snp.trailing).offset(12)
            $0.centerY.equalTo(top5Lbl)
        }
        countTag5Lbl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(top5Lbl)
        }
    }
    
    func customLabel() {
        
        paragraphStyle.lineHeightMultiple = 1.23
        
        top1Lbl.attributedText = NSMutableAttributedString(string: "Top 1", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        tag1Lbl.attributedText = NSMutableAttributedString(string: "태그 1", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        countTag1Lbl.attributedText = NSMutableAttributedString(string: "130개", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        top2Lbl.attributedText = NSMutableAttributedString(string: "Top 2", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        tag2Lbl.attributedText = NSMutableAttributedString(string: "태그 3", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        countTag2Lbl.attributedText = NSMutableAttributedString(string: "24개", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        top3Lbl.attributedText = NSMutableAttributedString(string: "Top 3", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        tag3Lbl.attributedText = NSMutableAttributedString(string: "태그 2", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        countTag3Lbl.attributedText = NSMutableAttributedString(string: "11개", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        top4Lbl.attributedText = NSMutableAttributedString(string: "Top 4", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        tag4Lbl.attributedText = NSMutableAttributedString(string: "태그 4", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        countTag4Lbl.attributedText = NSMutableAttributedString(string: "7개", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        top5Lbl.attributedText = NSMutableAttributedString(string: "Top 5", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        tag5Lbl.attributedText = NSMutableAttributedString(string: "태그 5", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        countTag5Lbl.attributedText = NSMutableAttributedString(string: "5개", attributes: [NSAttributedString.Key.kern: 0.03, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }

        let chartDataSet = PieChartDataSet(entries: dataEntries, label: "")
       
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [
            UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1),
            UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1),
            UIColor(red: 0.828, green: 0.946, blue: 0.627, alpha: 1),
            UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)]
        chartDataSet.highlightEnabled = false
        
        let chartData = PieChartData(dataSets: [chartDataSet])
        pieChartView.data = chartData
        
        pieChartView.backgroundColor = .white
        
        pieChartView.chartDescription.text = ""
        
        pieChartView.legend.enabled = false
        
        pieChartView.holeRadiusPercent = 0.6 // 0.7
        pieChartView.transparentCircleRadiusPercent = 0
        pieChartView.chartDescription.enabled = false
        
        // margin 없애기
        pieChartView.minOffset = 0
        pieChartView.setExtraOffsets(left: -18, top: -18, right: -18, bottom: -18)
    }
}
