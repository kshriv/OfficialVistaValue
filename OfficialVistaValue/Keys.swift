//
//  Keys.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/15/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import Foundation
import UIKit
import Charts

class Keys {
    
    static func setAllArrays() {
        for charge in chargeArray.reversed() {
            let name = charge.category
            
            switch name {
                
            case "Alcohol & Bars":
                alcoholAndBarsArray.append(charge)
                break
            case "Auto":
                autoArray.append(charge)
                break
            case "Beauty":
                beautyArray.append(charge)
                break
            case "Bills":
                billsArray.append(charge)
                break
            case "Clothing & Shoes":
                clothingAndShoesArray.append(charge)
                break
            case "Education":
                educationArray.append(charge)
                break
            case "Electronics & Software":
                electronicsAndSoftwareArray.append(charge)
                break
            case "Entertainment":
                entertainmentArray.append(charge)
                break
            case "Fees & Charges":
                feesAndChargesArray.append(charge)
                break
            case "Food & Dining":
                foodAndDiningArray.append(charge)
                break
            case "Gas & Fuel":
                foodAndDiningArray.append(charge)
                break
            case "Gifts & Donations":
                giftsAndDonationsArray.append(charge)
                break
            case "Health & Fitness":
                healthAndFitnessArray.append(charge)
                break
            case "Hobbies":
                hobbiesArray.append(charge)
                break
            case "Home Decor":
                homeDecorArray.append(charge)
                break
            case "Home Repairs":
                homeRepairsArray.append(charge)
                break
            case "Insurance":
                insuranceArray.append(charge)
                break
            case "Loans":
                loansArray.append(charge)
                break
            case "Other":
                otherArray.append(charge)
                break
            case "Pets":
                petsArray.append(charge)
                break
            case "Public Transportation":
                publicTransportationArray.append(charge)
                break
            case "Subscriptions":
                subscriptionsArray.append(charge)
                break
            case "Taxes":
                taxesArray.append(charge)
                break
            case "Travel":
                travelArray.append(charge)
                break
            case "Utilities":
                utilitiesArray.append(charge)
                break
            default:
                break
            }
           
        }
    }
    
}

struct Charge : Codable {
    
    var date : Date
    var category : String
    var amount : Double
    
    init (date: Date, category: String, amount: Double) {
        self.date = date
        self.category = category
        self.amount = amount

    }
}

struct UserDefaultKey {

    static let alcoholAndBars = "Alcohol & Bars"
    static let auto = "Auto"
    static let beauty = "Beauty"
    static let bills = "Bills"
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
    
    static let totalExpenses = "Sum of Expenses"
    static let chargeArray = "Charge Array"
}


//array of all the keys
var arrOfKeys = [UserDefaultKey.alcoholAndBars, UserDefaultKey.auto, UserDefaultKey.beauty, UserDefaultKey.bills, UserDefaultKey.clothingAndShoes, UserDefaultKey.education, UserDefaultKey.electronicsAndSoftware, UserDefaultKey.entertainment, UserDefaultKey.feesAndCharges, UserDefaultKey.foodAndDining, UserDefaultKey.gasAndFuel, UserDefaultKey.giftsAndDonations, UserDefaultKey.healthAndFitness, UserDefaultKey.hobbies, UserDefaultKey.homeDecor, UserDefaultKey.homeRepairs, UserDefaultKey.insurance, UserDefaultKey.loans, UserDefaultKey.other, UserDefaultKey.pets, UserDefaultKey.publicTransportation, UserDefaultKey.subscriptions, UserDefaultKey.taxes, UserDefaultKey.travel, UserDefaultKey.utilities]


//Holds charges specific to the category
var alcoholAndBarsArray = [Charge]()
var autoArray = [Charge]()
var beautyArray = [Charge]()
var billsArray = [Charge]()
var clothingAndShoesArray = [Charge]()
var educationArray = [Charge]()
var electronicsAndSoftwareArray = [Charge]()
var entertainmentArray = [Charge]()
var feesAndChargesArray = [Charge]()
var foodAndDiningArray = [Charge]()
var gasAndFuelArray = [Charge]()
var giftsAndDonationsArray = [Charge]()
var healthAndFitnessArray = [Charge]()
var hobbiesArray = [Charge]()
var homeDecorArray = [Charge]()
var homeRepairsArray = [Charge]()
var insuranceArray = [Charge]()
var loansArray = [Charge]()
var otherArray = [Charge]()
var petsArray = [Charge]()
var publicTransportationArray = [Charge]()
var subscriptionsArray = [Charge]()
var taxesArray = [Charge]()
var travelArray = [Charge]()
var utilitiesArray = [Charge]()



