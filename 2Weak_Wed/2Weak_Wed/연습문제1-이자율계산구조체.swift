//
//  연습문제1-이자율계산구조체.swift
//  2Weak_Wed
//
//  Created by 이건행 on 2021/11/15.
//

import Foundation

struct InterestRate {
    func getInterestRate(byDay: Int) -> Double {
        var interestRate: Double = 0
        
        switch byDay {
        case 0:
            interestRate = 0.0
        case 1...90:
            interestRate = 0.005
        case 91...180:
            interestRate = 0.01
        case 181...364:
            interestRate = 0.02
        case 365...:
            interestRate = 0.056
        default:
            interestRate = 0
        }
        return interestRate
    }
    
    func calculateAmount(day: Int, amount: Int) -> Double {
        var amountOfrate = Double(amount)   //day int 타입 형변환
        amountOfrate += Double(amount) * (getInterestRate(byDay: day) * 100)
        
        return amountOfrate
    }
}
var myInterestRate = InterestRate()
