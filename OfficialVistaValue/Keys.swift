//
//  Keys.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/15/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import Foundation
import UIKit

struct Charge {
    
    var date : Date
    var category : UserDefaultKey
    var amount : Double
    
    init (date: Date, category: UserDefaultKey, amount: Double) {
        self.date = date
        self.category = category
        self.amount = amount

    }
}

struct UserDefaultKey {

    static let alcoholAndBars = "Alcohol & Bars"
    static let auto = "auto"
    static let beauty = "beauty"
    static let bills = "bills"
    static let clothingAndShoes = "Clothing & Shoes"
    static let education = "Education"
    static let electronicsAndSoftware = "Electronics & Software"
    static let entertainment = "Entertainment"
    static let feesAndCharges = "Fees & Charges"
    static let foodAndDining = "Food & Dining"
    static let gasAndFuel = "Gas & Fuel"
    static let giftsAndDonations = "Gifts & Donations"
    static let healthAndFitness = "Health & Fitness"
    static let hobbies = "Hobbies"
    static let homeDecor = "Home Decor"
    static let homeRepairs = "Home Repairs"
    static let insurance = "Insurance"
    static let loans = "Loans"
    static let other = "Other"
    static let pets = "Pets"
    static let publicTransportation = "Public Transportation"
    static let subscriptions = "Subscriptions"
    static let taxes = "Taxes"
    static let travel = "Travel"
    static let utilities = "Utilities"

}
