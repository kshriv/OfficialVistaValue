//
//  ViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

var sumOfExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
var chargeArray = [Charge]()

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    var backgroundView: BackgroundView!
    @IBOutlet var header: UILabel!
    @IBOutlet var addExpenseButton: UIButton!
    @IBOutlet var totalExpense: UILabel!
    @IBOutlet var graphsView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        //Answer the notification call to update the Total Expenses
        NotificationCenter.default.addObserver(forName: .updateTotalExpenseLabel, object: nil, queue: OperationQueue.main) { (notification) in
            self.dismissPopupController()
        }
        
        setChargeArray()
    }

    func setChargeArray() {
        let test = defaults.object(forKey: UserDefaultKey.chargeArray) as? [Charge]
        if (test != nil) {
            chargeArray = defaults.object(forKey: UserDefaultKey.chargeArray) as! [Charge]
        } 
    }
    
    //Delete later
    func resetDefaults() {
          let defaults = UserDefaults.standard
          let dictionary = defaults.dictionaryRepresentation()
          dictionary.keys.forEach { key in
              defaults.removeObject(forKey: key)
          }
    }
    
    @IBAction func addExpenseButtonTapped(_ sender: Any) {
        let blurEffectView = blurEffect()
        mainView.addSubview(blurEffectView)
    }
    
    func dismissPopupController() {
        let viewToRemove = self.mainView.subviews.last
        viewToRemove?.removeFromSuperview()
        setupTotalExpenseDisplay()
    }
    
}

 

//Sets up background
extension ViewController {
    
    func blurEffect() -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = mainView.bounds
        return blurredEffectView
    }
    
    private func setupBackgroundView() {
        backgroundView = BackgroundView(frame: view.frame)
        view.insertSubview(backgroundView, at: 0)
        setupHead()
        setupExpenseButton()
        setupTotalExpenseDisplay()
        //setupGraphsDisplay()
    }
    
    private func setupHead() {
        header.adjustsFontSizeToFitWidth = true
        header.textAlignment = .center
        header.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 8)
        header.minimumScaleFactor = 0.25
        header.numberOfLines = 0
        header.font = header.font.withSize(self.view.frame.width / 6)
    }
        
    private func setupExpenseButton() {
        addExpenseButton.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width / 1.25, height: self.view.frame.height / 8)
        addExpenseButton.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 4)
        addExpenseButton.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    private func setupTotalExpenseDisplay() {
        sumOfExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
        let sumToDisplay = NSMutableAttributedString(string: (String(format: "%.2f", sumOfExpenses)), attributes: [NSAttributedString.Key.foregroundColor : UIColor.green, NSAttributedString.Key.font : UIFont.systemFont(ofSize: self.view.frame.width / 12)])
        let totalString = NSMutableAttributedString(string: "Total Expense:\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.systemFont(ofSize: self.view.frame.width / 16)])
        totalString.append(sumToDisplay)
        
        totalExpense.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width, height: self.view.frame.height / 8)
        totalExpense.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 1.1)
        totalExpense.attributedText = totalString
        totalExpense.adjustsFontSizeToFitWidth = true
        totalExpense.textAlignment = .center
        totalExpense.minimumScaleFactor = 0.25
        totalExpense.numberOfLines = 0
    }
       
//    private func setupGraphsDisplay() {
//        graphsView.frame = CGRect(x: self.view.frame.midX , y: self.view.frame.midY, width: self.view.frame.width / 1.25, height: self.view.frame.height / 2.25)
//        //graphsView.contentMode = UIView.ContentMode.scaleAspectFill
//        graphsView.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height / 1.75)
//    }
}

//Returns an array of the subviews of a view
extension UIView {
    private func subviews(parentView: UIView, level: Int = 0, printSubviews: Bool = false) -> [UIView] {
        var result = [UIView]()
        if level == 0 && printSubviews {
            result.append(parentView)
            print("\(parentView.viewInfo)")
        }

        for subview in parentView.subviews {
            if printSubviews { print("\(String(repeating: "-", count: level))\(subview.viewInfo)") }
            result.append(subview)
            if subview.subviews.isEmpty { continue }
            result += subviews(parentView: subview, level: level+1, printSubviews: printSubviews)
        }
        return result
    }
    private var viewInfo: String { return "\(classForCoder), frame: \(frame))" }
    var allSubviews: [UIView] { return subviews(parentView: self) }
    func printSubviews() { _ = subviews(parentView: self, printSubviews: true) }
}
