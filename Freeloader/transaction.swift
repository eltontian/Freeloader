//
//  transaction.swift
//  inDebt
//
//  Created by Andrew Hoang on 2/7/15.
//  Copyright (c) 2015 Andrew Hoang. All rights reserved.
//

import Foundation

class Transaction {
    var borrowerId: Int16
    var lenderId: Int16
    var amount: Double
    var comment: String
    var complete: Bool
    
    var date: NSDate
    var calendar: NSCalendar
    var hour:Int
    var minutes:Int
    var seconds: Int
    
    
    init(borrower:Int16, lender:Int16, amt:Double, comment:String) {
        borrowerId=borrower
        lenderId=lender
        amount=amt
        self.comment=comment
        complete=false
        date = NSDate()
        calendar = NSCalendar.currentCalendar()
        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        self.hour = components.hour
        self.minutes = components.minute
        self.seconds = components.second
    }
    
    func completeTransaction(){
        complete=true
    }
    
}