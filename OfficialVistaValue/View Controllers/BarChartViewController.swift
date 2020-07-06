//
//  BarChartViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 7/2/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController {
    

    @IBOutlet weak var barChartView: BarChartView!
    
    var players = [String]()
    var goals = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
        barChartView.animate(yAxisDuration: 2.0)
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawBordersEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.drawGridBackgroundEnabled = true
        barChartView.chartDescription?.text = ""
        
        setChart(dataPoints: players, values: goals.map { Double($0) })
    }
    
    func loadData() {
        for key in arrOfKeys {
            if ((defaults.double(forKey: key)) > 0.0) {
                players.append(key)
                goals.append(defaults.double(forKey: key))
            }
        }
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "No data available"
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Categories")
        chartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
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
