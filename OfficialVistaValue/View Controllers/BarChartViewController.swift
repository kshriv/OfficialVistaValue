//
//  BarChartViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 7/2/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var arrOfDates = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lineChartView.rightAxis.enabled = false
        setData()
    }
    
    //im a God for not the logic but the fact that it worked in one compile
    func setData() {
        setAllArrays()
        
        var lineChartDataSetArr = [IChartDataSet]()
        
        for category in arrOfKeys {
            var chartEntries = [ChartDataEntry]()
            let categoryArray = returnArray(name: category)
            if (categoryArray.count != 0) {
                for charge in categoryArray {
                    let entry = ChartDataEntry(x: convertDate(date: charge.date), y: charge.amount)
                    chartEntries.append(entry)
                }
                if (chartEntries.count != 0) {
                    let set = LineChartDataSet(entries: chartEntries, label: category)
                    let color = randomColor()
                    set.drawCirclesEnabled = true
                    set.mode = .cubicBezier
                    set.lineWidth = 2
                    set.setColor(color)
                    set.setCircleColor(color)
                    lineChartDataSetArr.append(set)
                }
            }
        }

        let data = LineChartData(dataSets: lineChartDataSetArr)
        lineChartView.data = data
        lineChartView.xAxis.entries = arrOfDates
        if (arrOfDates.count < 8) {
            lineChartView.xAxis.setLabelCount(arrOfDates.count, force: true)
        } else {
            lineChartView.xAxis.setLabelCount(7, force: true)
        }
        
    }
    
    func convertDate(date: Date) -> Double {
        let month = Calendar.current.dateComponents([.month], from: date).month!
        let day = Calendar.current.dateComponents([.day], from: date).day!
        let dateDouble = (Double)(month) + (((Double)(day)) / 100.0)
        
        if(!arrOfDates.contains(dateDouble)) {
            arrOfDates.append(dateDouble)
        }
        return dateDouble
    }
    
    private func randomColor() -> UIColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        return color
    }

    
}
