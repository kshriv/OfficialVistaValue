//
//  PieChartViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 7/1/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    
    var players = [String]()
    var goals = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        customizeChart(dataPoints: players, values: goals.map{ Double($0) })
    }
    
    func loadData() {
        for key in arrOfKeys {
            if ((defaults.double(forKey: key)) > 0.0) {
                players.append(key)
                goals.append(defaults.double(forKey: key))
            }
        }
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        pieChart.noDataText = "No data available"
        // TO-DO: customize the chart here
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        // 2. Set ChartDataSet
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        // 3. Set ChartData
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        pieChart.data = pieChartData
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
}
