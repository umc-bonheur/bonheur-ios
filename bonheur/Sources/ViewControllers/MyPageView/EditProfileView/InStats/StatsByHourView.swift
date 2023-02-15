//
//  StatsByHourView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then
import Charts

class StatsByHourView: BarChartView {

    private let titleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "시간별 통계", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1)
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
    }
    
    private let mainView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    
    let greenLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 14)
        $0.textAlignment = .right
    }
    
    let grayLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "에 가장 많이 기록했어요", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
    }
    
    let barChartView = BarChartView()
    
    // 임시
    let time = ["아침", "오후", "저녁", "밤", "새벽"]
    var unitsRecorded = [19.0, 21.0, 13.0, 24.0, 13.0]

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpView()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUpView()
        setUpConstraints()
    }

    func setUpView() {
        
        [titleLbl, mainView].forEach {
            addSubview($0)
        }
        [greenLbl, grayLbl, barChartView].forEach {
            mainView.addSubview($0)
        }
//        setChart(dataPoints: time, values: unitsRecorded)
    }

    func setUpConstraints() {
        
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(16)
        }
        mainView.snp.makeConstraints {
            $0.top.equalTo(titleLbl.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview()
        }
        greenLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.trailing.equalTo(grayLbl.snp.leading)
        }
        grayLbl.snp.makeConstraints {
            $0.centerY.equalTo(greenLbl)
            $0.trailing.equalToSuperview().inset(12)
        }
        barChartView.snp.makeConstraints {
            $0.top.equalTo(greenLbl.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(Constant.height * 169)
        }
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = []

        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "")
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)]
        chartDataSet.highlightEnabled = false
        
        let chartData = BarChartData(dataSets: [chartDataSet])
        barChartView.data = chartData
        
        chartData.barWidth = 0.5
        barChartView.backgroundColor = .white
        barChartView.chartDescription.text = ""
        barChartView.xAxis.axisLineColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: time)
        barChartView.xAxis.setLabelCount(time.count, force: false)
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.labelTextColor = UIColor(red: 0.445, green: 0.45, blue: 0.446, alpha: 1)
        barChartView.xAxis.labelFont = UIFont(name: "SFPro-Regular", size: 10)!
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.avoidFirstLastClippingEnabled = false // 첫번째 label의 위치를 bar 중앙으로 배치
        barChartView.leftAxis.axisMinimum = 0.001 // 0으로 하면 표시되는 것 방지
        barChartView.leftAxis.gridColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
        barChartView.leftAxis.labelCount = 5
        barChartView.leftAxis.labelTextColor = UIColor(red: 0.445, green: 0.45, blue: 0.446, alpha: 1)
        barChartView.leftAxis.labelFont = UIFont(name: "SFPro-Regular", size: 10)!
        barChartView.leftAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.gridLineCap = .round
        barChartView.rightAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.drawAxisLineEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.legend.enabled = false
    }
}
