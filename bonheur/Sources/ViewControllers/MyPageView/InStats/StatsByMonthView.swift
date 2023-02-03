//
//  StatsByMonthView.swift
//  bonheur
//
//  Created by 김사랑 on 2023/01/31.
//

import UIKit
import SnapKit
import Then
import Charts

class StatsByMonthView: LineChartView {

    private let titleLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "월별 통계", attributes: [NSAttributedString.Key.kern: 0.02])
        $0.textColor = UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1)
        $0.font = UIFont(name: "SFPro-Medium", size: 16)
    }
    
    private let mainView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 15
    }
    
    private let greenLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "7월", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.533, green: 0.846, blue: 0.07, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFEB", size: 14)
        $0.textAlignment = .right
    }
    
    private let grayLbl = UILabel().then {
        $0.attributedText = NSMutableAttributedString(string: "에 가장 많이 기록했어요", attributes: [NSAttributedString.Key.kern: 0.04])
        $0.textColor = UIColor(red: 0.149, green: 0.15, blue: 0.149, alpha: 1)
        $0.font = UIFont(name: "NanumSquareRoundOTFB", size: 14)
    }
    
    private let lineChartView = LineChartView()
    
    var months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    let unitsRecorded = [20.0, 25.0, 20.0, 30.0, 20.0, 20.0, 35.0, 25.0, 25.0, 30.0, 20.0, 20.0]
    
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
        [greenLbl, grayLbl, lineChartView].forEach {
            mainView.addSubview($0)
        }
        setChart(dataPoints: months, values: unitsRecorded)
    }

    func setUpConstraints() {
        
        titleLbl.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24.5)
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
        lineChartView.snp.makeConstraints {
            $0.top.equalTo(greenLbl.snp.bottom).offset(68)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(Constant.height * 155)
        }
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }

        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "")
        chartDataSet.circleRadius = 3.5
        chartDataSet.circleColors = [UIColor(red: 0.828, green: 0.946, blue: 0.627, alpha: 1)]
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [UIColor(red: 0.37, green: 0.613, blue: 0.013, alpha: 1)]
        chartDataSet.highlightEnabled = false
        chartDataSet.lineWidth = 1.0
        
        let chartData = LineChartData(dataSets: [chartDataSet])
        lineChartView.data = chartData
        
        lineChartView.leftAxis.gridColor = UIColor(red: 0.842, green: 0.85, blue: 0.842, alpha: 1)
        lineChartView.leftAxis.labelCount = 4
        lineChartView.backgroundColor = .white
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lineChartView.xAxis.setLabelCount(months.count, force: true)
        
        lineChartView.chartDescription.text = ""
        lineChartView.rightAxis.gridLineCap = .round
        lineChartView.rightAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.labelTextColor = UIColor(red: 0.445, green: 0.45, blue: 0.446, alpha: 1)
        lineChartView.xAxis.labelFont = UIFont(name: "SFPro-Regular", size: 10)!
        lineChartView.leftAxis.labelTextColor = UIColor(red: 0.445, green: 0.45, blue: 0.446, alpha: 1)
        lineChartView.leftAxis.labelFont = UIFont(name: "SFPro-Regular", size: 10)!
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.xAxis.avoidFirstLastClippingEnabled = true
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.leftAxis.drawAxisLineEnabled = false
        lineChartView.pinchZoomEnabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.legend.enabled = false
    }
}
