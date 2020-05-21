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

//MARK: -UITable View Created Here
extension ListViewViewController : UITableViewDataSource, UITableViewDelegate {
    //Returns amount of items in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chargeArray.count
    }
    
    //Customizes each table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellListView", for: indexPath as IndexPath) as! ListViewCustomCell
        
        //customize cell here
        let amount = chargeArray[indexPath.row].amount
        cell.chargeAmount.text =  String(format: "%.2f", amount)
        cell.chargeTitleName.text = chargeArray[indexPath.row].category
        cell.date.text = convertDate(date: chargeArray[indexPath.row].date)
        
        return cell
    }
    
    //Allows you to swipe to delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Runs when the actual delete button is hit
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        deletePersistData(at: chargeArray[indexPath.row])

        if editingStyle == .delete {
            chargeArray.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        persistChargeArray(chargeArray)
        chargeArray = setChargeArray()
        
        //Update total expense label
        NotificationCenter.default.post(name: Notification.Name.updateTotalExpenseLabel, object: self)
        
        print("CHARGE ARRAY: \n", chargeArray)

    }
    
    //Formats the datel
    func convertDate(date: Date) -> String {
        let format = DateFormatter()
        format.timeZone = .current
        format.dateFormat = "MM-dd-yyyy"    //' at 'HH:mm a
        let dateString = format.string(from: date)
        return dateString
    }
    
    func deletePersistData(at charge: Charge) {
        let previousAmount = defaults.double(forKey: charge.category)
        defaults.set(previousAmount - charge.amount, forKey: charge.category)
        //Updates the total expense label
        let totalExpenses = defaults.double(forKey: UserDefaultKey.totalExpenses)
        defaults.set(totalExpenses - charge.amount, forKey: UserDefaultKey.totalExpenses)

    }
    
    func setChargeArray() -> [Charge] {
        guard let encodedData = defaults.array(forKey: UserDefaultKey.chargeArray) as? [Data] else {
           return []
        }
        return encodedData.map { try! JSONDecoder().decode(Charge.self, from: $0)}
    }
       
    func persistChargeArray(_ arrayOfCharges: [Charge]) {
       let data = arrayOfCharges.map { try? JSONEncoder().encode($0) }
       defaults.set(data, forKey: UserDefaultKey.chargeArray)
    }
    
    
}
