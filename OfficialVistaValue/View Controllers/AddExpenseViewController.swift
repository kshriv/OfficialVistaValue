//
//  AddExpenseViewController.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//
var defaults = UserDefaults.standard
var tableViewIndexSelected = -1

import UIKit
import Lottie

class AddExpenseViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var enterButtonOutlet: UIButton!
    
    let animationView = AnimationView()
    
    var arrayOfCategories : [String] = []
    var tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        configureTapGesture()
        arrayOfCategories = createArrayOfCategories()
    }
    
    private func createArrayOfCategories() -> [String] {
        var arrayOfCategories : [String] = []
        arrayOfCategories = ["Alcohol & Bars", "Auto", "Beauty", "Bills", "Clothing & Shoes", "Education", "Electronics & Software", "Entertainment", "Fees & Charges", "Food & Dining", "Gas & Fuel", "Gifts & Donations", "Health & Fitness", "Hobbies", "Home Decor", "Home Repairs", "Insurance", "Loans", "Other", "Pets", "Public Transportation", "Subscriptions", "Taxes", "Travel", "Utilities"]
        return arrayOfCategories
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let stringText = (textField.text! as NSString)
        if let text = textField.text, text.isEmpty {
            textField.shake()
        } else if (!stringText.isValidDouble(maxDecimalPlaces: 2)) {
            textField.shake()
        } else if (tableViewIndexSelected == -1) {
            tableView.shake()
        } else {
            enterButtonOutlet.isUserInteractionEnabled = false
            
            //Animate the green check mark
            startCheckAnimation(animationName: "782-check-mark-success")
            
            //Do the rest of the operations in here
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                guard let expense = Double(self.textField.text!) else { return }
                //sumOfExpenses += expense
                print(sumOfExpenses)
                self.persistData(expense: expense)

                //Call notification center to update the Total Expense label
                NotificationCenter.default.post(name: Notification.Name.updateTotalExpenseLabel, object: self)
                
                //Dismisses popup controller
                self.dismiss(animated: true, completion: nil)
                self.enterButtonOutlet.isUserInteractionEnabled = true
                
            }
        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
        //Call notification center to update the Total Expense label
        NotificationCenter.default.post(name: Notification.Name.updateTotalExpenseLabel, object: self)
        
        //Dismisses popup controller
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: -Handles UITableView
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
    }
}

//MARK: -User Defaults
extension AddExpenseViewController {
    func persistData(expense : Double) {
        let charge = Charge(date: Date(), category: arrayOfCategories[tableViewIndexSelected], amount: expense)
        let previousAmount = defaults.double(forKey: charge.category)
        
        //Updating the categories relative total expense
        defaults.set(expense + previousAmount, forKey: charge.category)
        
        //Sum of expenses persistence
        sumOfExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
        defaults.set(sumOfExpenses + charge.amount, forKey: UserDefaultKey.totalExpenses)
        sumOfExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
        
        //Charge array persistence
        chargeArray = setChargeArray()
        chargeArray.insert(charge, at: 0)
        persistChargeArray(chargeArray)
        chargeArray = setChargeArray()
        print("CHARGE ARRAY: ", chargeArray)
    }
    
    func persistChargeArray(_ arrayOfCharges: [Charge]) {
        let data = arrayOfCharges.map { try? JSONEncoder().encode($0) }
        defaults.set(data, forKey: UserDefaultKey.chargeArray)
    }
    
    
    func setChargeArray() -> [Charge] {
        guard let encodedData = defaults.array(forKey: UserDefaultKey.chargeArray) as? [Data] else {
            return []
        }
        return encodedData.map { try! JSONDecoder().decode(Charge.self, from: $0)}
    }
    
    func resetDefaults() {
          let defaults = UserDefaults.standard
          let dictionary = defaults.dictionaryRepresentation()
          dictionary.keys.forEach { key in
              defaults.removeObject(forKey: key)
          }
    }
     
}

//MARK: -Backgrounds and Animations
extension AddExpenseViewController {
    
    private func setupBackgroundView() {
        backgroundImage.layer.cornerRadius = 9
        tableView.layer.cornerRadius = 5
    }
    
    private func startCheckAnimation(animationName String: String) {
        animationView.animation = Animation.named("782-check-mark-success")
        animationView.frame = tableView.bounds
        animationView.center = backgroundImage.center
        animationView.backgroundColor = UIColor.clear
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        view.addSubview(animationView)
        
    }
    
    private func configureTapGesture() {
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddExpenseViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
        view.removeGestureRecognizer(tapGesture)
    }
    
}

//MARK: -Text Field shake animation
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

//MARK: -Checks if the input is a monetary amount
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


