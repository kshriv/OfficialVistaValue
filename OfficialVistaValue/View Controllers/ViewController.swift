//
//  ViewController.swift
//  OfficialVistaValue
//
//  Created by Komal Shrivastava on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit
import Lottie
import LocalAuthentication

var sumOfExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
var chargeArray = [Charge]()

class ViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    var backgroundView: BackgroundView!
    @IBOutlet var header: UILabel!
    @IBOutlet var addExpenseButton: UIButton!
    @IBOutlet var totalExpense: UILabel!
    @IBOutlet var buttonStack: UIStackView!
    @IBOutlet var animationView: AnimationView!
    @IBOutlet var animationView1: AnimationView!
    @IBOutlet var animationView2: AnimationView!
    
    //MARK: -TEST
    let coinLoadingImage = UIImageView(image: UIImage(named: "coin")!)
    let splashView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingScreen()
        setupBackgroundView()
        chargeArray = self.setChargeArray()
        print(chargeArray)
        
        //Answer the notification call to update the Total Expenses and Dismiss AddExpenseVC
        NotificationCenter.default.addObserver(forName: .dismissViewAndUpdateTotalExpenseLabel, object: nil, queue: OperationQueue.main) { (notification) in
            self.dismissPopupController()
            self.setupTotalExpenseDisplay()
        }
        
        //Answer notification to update total expense label
        NotificationCenter.default.addObserver(forName: .updateTotalExpenseLabel, object: nil, queue: OperationQueue.main) { (notification) in
            print("NOTIFIATION RECIEVED")
            self.setupTotalExpenseDisplay()
        }
    
    }
    
    func loadFaceID() {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To be able to use app") { (good, error) in
                if (good) {
                    print("good")
                } else {
                    self.loadFaceID()
                }
            }
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
    
    func setChargeArray() -> [Charge] {
        guard let encodedData = defaults.array(forKey: UserDefaultKey.chargeArray) as? [Data] else {
            return []
        }
        return encodedData.map { try! JSONDecoder().decode(Charge.self, from: $0)}
    }
    
    @IBAction func addExpenseButtonTapped(_ sender: Any) {
        let blurEffectView = blurEffect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.mainView.addSubview(blurEffectView)
        }
    }

    func dismissPopupController() {
        let viewToRemove = self.mainView.subviews.last
        viewToRemove?.removeFromSuperview()
    }
}

 

//MARK: -Sets up background
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
        startAnimations()
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
        
        //error handling
        if (sumOfExpenses <= 0) {
            resetDefaults()
        }
        
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

//MARK: -Homepage Animations
extension ViewController {
    func startAnimations() {
        startBarAnimation(animationName: "lf30_editor_lRx4Tb")
        startPieAnimation(animationName: "lf30_editor_lcnDSn")
        startListAnimation(animationName: "lf30_editor_epk6GS")
    }
    private func startBarAnimation(animationName String: String) {
        animationView.animation = Animation.named(String)
        animationView.backgroundColor = UIColor.clear
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .autoReverse
        animationView.animationSpeed = 2.5
        animationView.play()
        animationView.clipsToBounds = true
    }
    private func startPieAnimation(animationName String: String) {
        animationView1.animation = Animation.named(String)
        animationView1.backgroundColor = UIColor.clear
        animationView1.contentMode = .scaleAspectFit
        animationView1.loopMode = .autoReverse
        animationView1.play()
        animationView1.clipsToBounds = true
    }
    private func startListAnimation(animationName String: String) {
        animationView2.animation = Animation.named(String)
        animationView2.backgroundColor = UIColor.clear
        animationView2.contentMode = .scaleAspectFit
        animationView2.loopMode = .loop
        animationView2.play()
        animationView2.clipsToBounds = true
    }
}

//MARK: -Sets up Loading Screen + Animations
extension ViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Sensitive Information Ahead!") { (good, error) in
                if (good) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.62) {
                        self.scaleDownAnimation()
                    }
                } else {
                    self.viewDidAppear(true)
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.62) {
                self.scaleDownAnimation()
            }
        }
    }
    func setupLoadingScreen() {
        splashView.backgroundColor = UIColor(patternImage: UIImage(named: "gradient")!)
        view.addSubview(splashView)
        splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        coinLoadingImage.contentMode = .scaleAspectFit
        splashView.addSubview(coinLoadingImage)
        coinLoadingImage.frame = CGRect(x: splashView.frame.maxX - 120, y: splashView.frame.maxY - 64, width: 240, height: 128)
        coinLoadingImage.center = splashView.center
    }
    func scaleDownAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
            self.coinLoadingImage.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { ( success) in
            self.scaleUpAnimation()
        }
    }
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.20, delay: 0.1, options: .curveEaseIn, animations: {
            self.coinLoadingImage.transform = CGAffineTransform(scaleX: 8, y: 8)
        }) { ( success ) in
            self.removeSplashView()
        }
    }
    func removeSplashView() {
        splashView.removeFromSuperview()
    }
}


