//
//  AddExpenseViewController.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var textField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        configureTapGesture()
        // Do any additional setup after loading the view.
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(AddExpenseViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}

//Backgrounds and Animations
extension AddExpenseViewController {
    
    private func setupBackgroundView() {
        backgroundImage.layer.cornerRadius = 9
    }
    
    @IBAction func enterButton(_ sender: Any) {
        let stringText = (textField.text! as NSString)
        if let text = textField.text, text.isEmpty {
            textField.shake()
            print("empty")
        } else if (!stringText.isValidDouble(maxDecimalPlaces: 2)) {
            textField.shake()
            print("invalid")
        } else {
            print("valid")
            guard let expense = Double(textField.text!) else { return }
            sumOfExpenses += expense
            print(sumOfExpenses)
            dismiss(animated: true, completion: nil)
        }
    }
}


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

