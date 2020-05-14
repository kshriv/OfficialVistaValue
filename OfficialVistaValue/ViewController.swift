//
//  ViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainView: UIView!
    var backgroundView: BackgroundView!
    @IBOutlet var header: UILabel!
    @IBOutlet var addExpenseButton: UIButton!
    @IBOutlet var totalExpense: UILabel!
    @IBOutlet var graphsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBackgroundView()
        setupComponents()
    }
}

//Sets up background
extension ViewController {
    
    private func setupBackgroundView() {
        backgroundView = BackgroundView(frame: view.frame)
        view.insertSubview(backgroundView, at: 0)
    }
    
    private func setupComponents() {
        header.adjustsFontSizeToFitWidth = true
        header.textAlignment = .center
        header.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 9.5)
        header.minimumScaleFactor = 0.25
        header.numberOfLines = 0
        header.font = header.font.withSize(self.view.frame.width / 8)
        
        addExpenseButton.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width / 1.75, height: self.view.frame.height / 10)
        addExpenseButton.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 5)
        //addExpenseButton.contentMode = UIView.ContentMode.scaleAspectFill
        
        totalExpense.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width, height: self.view.frame.height / 8)
        totalExpense.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 1.2)
        totalExpense.adjustsFontSizeToFitWidth = true
        totalExpense.textAlignment = .center
        totalExpense.minimumScaleFactor = 0.25
        totalExpense.numberOfLines = 0
        totalExpense.font = totalExpense.font.withSize(self.view.frame.width / 16)
        
        graphsView.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width / 1.25, height: self.view.frame.height / 2.25)
        //graphsView.contentMode = UIView.ContentMode.scaleAspectFill
        graphsView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
    }
}
