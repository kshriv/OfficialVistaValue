//
//  NotificationNameExtension.swift
//  OfficialVistaValue
//
//  Created by Ari Jain on 5/14/20.
//  Copyright © 2020 Komal Shrivastava. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    
    static let dismissViewAndUpdateTotalExpenseLabel = Notification.Name(rawValue: "dismissViewAndUpdateTotalExpenseLabe")
    static let setChargeArray = Notification.Name(rawValue: "setChargeArray")
    static let updateTotalExpenseLabel = Notification.Name(rawValue: "updateTotalExpenseLabel")
}
