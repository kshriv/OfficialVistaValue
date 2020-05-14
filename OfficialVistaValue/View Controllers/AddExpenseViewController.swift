//
//  AddExpenseViewController.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/13/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

class AddExpenseViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        // Do any additional setup after loading the view.
    }

    @IBAction func dismissAnimation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

//Backgrounds and Animations
extension AddExpenseViewController {
    
    private func setupBackgroundView() {
        backgroundImage.layer.cornerRadius = 9
    }
    
}

