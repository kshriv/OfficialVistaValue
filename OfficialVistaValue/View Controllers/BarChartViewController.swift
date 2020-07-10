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
    

    @IBOutlet weak var lineChartView: LineChartView!
    var lineChartDataSetArray = [LineChartDataSet]()
    
    override func viewDidLoad() {
        view.addSubview(lineChartView)
    }
    
    func setData() {
        for category in arrOfKeys {
            
        }
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
