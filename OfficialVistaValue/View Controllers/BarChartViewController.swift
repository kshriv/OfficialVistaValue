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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChartView.rightAxis.enabled = false
        setData()
    }
    
    //im a god for not the logic but the face that it worked in one compile
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
                    set.drawCirclesEnabled = false
                    set.mode = .cubicBezier
                    set.lineWidth = 2
                    lineChartDataSetArr.append(set)
                }
            }
        }
        
        let data = LineChartData(dataSets: lineChartDataSetArr)
        lineChartView.data = data
        
    }
    

    func convertDate(date: Date) -> Double {
        let month = Calendar.current.dateComponents([.month], from: date).month!
        let day = Calendar.current.dateComponents([.day], from: date).day!
        let dateDouble = (Double)(month) + (((Double)(day)) / 100.0)
        return dateDouble
    }

    
}
