//
//  ChartView.swift
//  Drama
//
//  Created by 정기욱 on 2019/12/30.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import Charts

class ChartView: UIView {

    enum ChartType: String {
        case average = "전체 평점"
        case episode = "회차별 평점"
        case my      = "나의 회차별 평점"
    }

    
    
    var gradeType: ChartType?
    var chartView: ChartViewBase!
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 24)
        title.textColor = .black
        return title
    }()
    
    convenience init(type: ChartType){
        self.init(frame: CGRect.zero)
        
        self.gradeType = type
        self.chartView = self.chartCheck(type: type)
        self.title.text = type.rawValue
        
        addSubview(title)
        addSubview(chartView)
        setupAutoLayout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("required method 에러")
    }

    private func chartCheck(type: ChartType) -> ChartViewBase {
        switch type {
            case .average:
                let bar = BarChartView()
                barChartUpdate(barChart: bar)
                return bar
            case .episode, .my:
                let line = LineChartView()
                lineChartUpdate(lineChart: line)
                return line
            }
    }
    
    private func barChartUpdate(barChart: BarChartView) {
        let entry1 = BarChartDataEntry(x: 0, y: Double(3.5))
        let entry2 = BarChartDataEntry(x: 1, y: Double(4.5))
        
    
        
        let dataSet = BarChartDataSet(entries: [entry1, entry2] , label: "전체 평점")
        dataSet.setColor(.brown)
       
        
        let data = BarChartData(dataSets: [dataSet])
        barChart.data = data
        
        
        
        barChart.legend.enabled = false
        // X-axis line
        barChart.xAxis.drawAxisLineEnabled = true
        barChart.xAxis.axisLineColor = .black

        // X-axis labels
        barChart.xAxis.labelTextColor = .black
        barChart.xAxis.labelPosition = .bottom


        
        // grid lines
        barChart.xAxis.drawAxisLineEnabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.leftAxis.drawAxisLineEnabled = false
        barChart.leftAxis.drawGridLinesEnabled = false
        barChart.rightAxis.drawAxisLineEnabled = false
        barChart.rightAxis.drawGridLinesEnabled = false
        barChart.leftAxis.drawLabelsEnabled = false
        barChart.rightAxis.drawLabelsEnabled = false
        barChart.leftAxis.axisMinimum = 0
        
        barChart.isUserInteractionEnabled = false

        

        barChart.notifyDataSetChanged()
    }
    
    private func lineChartUpdate(lineChart: LineChartView) {
        
        let values = [3.5, 4.2, 3.4, 3.2, 3.1, 4.3, 4.2, 3.4, 3.2, 3.1, 3.3, 4.2, 3.4, 3.2, 3.1, 4.9]
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<values.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "전체 평점")
        lineChartDataSet.setColors(.brown)
        lineChartDataSet.setCircleColor(.brown)
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartData.setValueTextColor(.brown)
        lineChart.data = lineChartData
        
        // grid lines
        lineChart.xAxis.drawAxisLineEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.leftAxis.drawAxisLineEnabled = false
        lineChart.leftAxis.drawGridLinesEnabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.drawGridLinesEnabled = false
        lineChart.leftAxis.drawLabelsEnabled = false
        lineChart.rightAxis.drawLabelsEnabled = false
        lineChart.isUserInteractionEnabled = false
        
        lineChart.leftAxis.axisMinimum = 0
        
        
        
        lineChart.legend.enabled = false
        // X-axis line
        lineChart.xAxis.drawAxisLineEnabled = true
        lineChart.xAxis.axisLineColor = .black

        // X-axis labels
        lineChart.xAxis.labelTextColor = .black
        lineChart.xAxis.labelPosition = .bottom
    }
}


//MARK: - UI AutoLayout

extension ChartView {
    private func setupAutoLayout() {
        title.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(25)
        }
        
        chartView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(20)
        }
        
    }
    
}
