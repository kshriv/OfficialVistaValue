//
//  AddExpenseViewController.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

var tableViewIndexSelected = -1

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfCategories : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
//        configureTapGesture()
        arrayOfCategories = createArrayOfCategories()
        
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    private func createArrayOfCategories() -> [String] {
        var arrayOfCategories : [String] = []
        arrayOfCategories = ["Alcohol & Bars", "Auto", "Beauty", "Bills", "Clothing & Shoes", "Education", "Electronics & Software", "Entertainment", "Fees & Charges", "Food & Dining", "Gas & Fuel", "Gifts & Donations", "Health & Fitness", "Hobbies", "Home", "Decor", "Home Repairs", "Insurance", "Loans", "Other", "Pets", "Public Transportation", "Subscriptions", "Taxes", "Travel", "Utilities"]
        return arrayOfCategories
    }
    
}

//Handles UITableView 
extension AddExpenseViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomCell
        cell.categoryCellLabel.text = arrayOfCategories[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewIndexSelected = indexPath.row
        print(tableViewIndexSelected)
    }
    
    
}

//Backgrounds and Animations
extension AddExpenseViewController {
    
    private func setupBackgroundView() {
        backgroundImage.layer.cornerRadius = 9
        tableView.layer.cornerRadius = 5
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let stringText = (textField.text! as NSString)
        if let text = textField.text, text.isEmpty {
            textField.shake()
            print("empty")
        } else if (!stringText.isValidDouble(maxDecimalPlaces: 2)) {
            textField.shake()
            print("invalid")
        } else if (tableViewIndexSelected == -1) {
            tableView.shake()
            print("invalid")
        } else {
            print("valid")
            guard let expense = Double(textField.text!) else { return }
            sumOfExpenses += expense
            print(sumOfExpenses)
            dismiss(animated: true, completion: nil)
            //Call notification center to update the Total Expense label
            NotificationCenter.default.post(name: Notification.Name.updateTotalExpenseLabel, object: self)
        }
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddExpenseViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}

//Text Field shake animation
extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 8.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 8.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}

extension UITableView {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 8.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 8.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}

//Checks if the input is a monetary amount
extension NSString {
  func isValidDouble(maxDecimalPlaces: Int) -> Bool {

    let formatter = NumberFormatter()
    formatter.allowsFloats = true
    let decimalSeparator = formatter.decimalSeparator ?? "."

    if formatter.number(from: self as String) != nil {
      let split = self.components(separatedBy: decimalSeparator)
      let digits = split.count == 2 ? split.last ?? "" : ""

      return digits.count <= maxDecimalPlaces
    }
    return false
  }
}
