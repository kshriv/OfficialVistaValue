//
//  ListViewViewController.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/15/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import UIKit

class ListViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ListViewViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chargeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellListView", for: indexPath as IndexPath) as! ListViewCustomCell
        
        //customize cell here
        let amount = chargeArray[indexPath.row].amount
        cell.chargeAmount.text =  "\(amount)"
        cell.chargeTitleName.text = chargeArray[indexPath.row].category
        
        print("CATERGORY: ", chargeArray[indexPath.row].category)
        print("AMOUNT: ", amount)
        
        return cell
    }
    
    
}
