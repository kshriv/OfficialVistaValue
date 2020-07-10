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
    }
    
    func setData() {
        //create a LineChartDataSet array
        //iterate over all the keys in the categories array
        //create a ChartDataEntry array
        //if the array corresponding to that key is not empty
        //add its x and y value to a chartdataentry object and add that to your chartdataentry array
        //if the chartdataentries array is not empty -> add it to the linechartdataset array
        //at the very end set data to data
        
        var lineChartDataSetArr = [LineChartDataSet]()
        
        for category in arrOfKeys {
            var array = [ChartDataEntry]()
            
        }
        
    }
    

    func convertDate(date: Date) -> Double {
        let month = Calendar.current.dateComponents([.month], from: date).month!
        let day = Calendar.current.dateComponents([.day], from: date).day!
        let dateDouble = (Double)(month) + (((Double)(day)) / 100.0)
        return dateDouble
    }

    
}
