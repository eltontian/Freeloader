//
//  user.swift
//  inDebt
//
//  Created by Andrew Hoang on 2/7/15.
//  Copyright (c) 2015 Andrew Hoang. All rights reserved.
//

import Foundation

class User {
    private var personId: Int16
    //private var email:String
    private var score: Int16
    private var increment: Int16
    private var totalDebt:Double
    private var totalLoan:Double
    
    init(id:Int16){
        personId=id
        score=50
        increment=4
        totalDebt=0
        totalLoan=0
    }
    
    func getCreditScore() -> Int16{
        return score
    }
    
    func setCreditScore(score:Int16){
        self.score=score
    }
    
    func onLoan(amount:Double){
        totalLoan += amount
    }
    
    func onDebt(amount:Double){
        totalDebt += amount
    }
    
    func onPayback(){
        self.score += increment
    }
    
    func onLend(){
        self.score += increment
    }
    
    func onLate(){
        self.score -= increment
    }

}