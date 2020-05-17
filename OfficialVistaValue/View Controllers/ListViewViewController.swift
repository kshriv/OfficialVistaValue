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
        cell.date.text = convertDate(date: chargeArray[indexPath.row].date)
        
        return cell
    }
    
    func convertDate(date: Date) -> String {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "MM-dd-yyyy"    //' at 'HH:mm a
        let dateString = format.string(from: date)
        return dateString
    }
    
    
}
