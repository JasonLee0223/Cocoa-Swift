//
//  연습문제2 아이디 규칙 검사.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//

import Foundation

struct PatternIDcheck {
    
    func IDValidator(password: String) -> Bool {
        let validatorID = CharacterSet(charactersIn: password)
        
        let onlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z"))
        let onlydecimal = CharacterSet.decimalDigits
        let idCondition = CharacterSet(charactersIn: "-").union(onlyEnglish).union(onlydecimal)
        
        // 5글자 미만이거나 24글자 이상이면 실패
        if password.count < 5 || password.count >= 24 {
            return false
        }
        
        // 영문 대소문자, 숫자, -만 포함 가능하고 그 외에는 실패
        else if !validatorID.isSubset(of: idCondition) {
            return false
        }
        
        // 같은 숫자가 연속해서 3회 이상 나오면 실패 111, 222
        else if sameNumber(input: password) {
            return false
        }
        
        // 숫자가 연번으로 3개나오면 실패 123, 234
        else if consecutiveThreeNumbers(input: password){
            return false
        } else {
            return true
        }
    }
    
    func sameNumber(input: String) -> Bool{
        let numbersInStr = input.map{ String($0) }.map{ Int($0) }
        var sameArr = [Int]()
        
        for i in numbersInStr {
            guard let addNum = i else {
                sameArr.removeAll()
                continue
            }
            sameArr.append(addNum)
            
            if sameArr.count >= 3 {
                if sameArr[0] == sameArr[1] && sameArr[1] == sameArr[2] {
                    print("똑같은 숫자가 연속해서 3회 입력되었습니다...")
                    return true
                } else {
                    sameArr.remove(at: 0)
                }
            }
        }
        return false
    }
    
    func consecutiveThreeNumbers(input: String) -> Bool{
        let numbersInStr = input.map{ String($0) }.map{ Int($0) }
        var consecutiveArr = [Int]()
        
        for i in numbersInStr {
            guard let consecuteNum = i else {
                consecutiveArr.removeAll()
                continue
            }
            consecutiveArr.append(consecuteNum)
            
            if consecutiveArr.count >= 3 {
                // 연속된 값이니까 '1'씩 차이남으로 앞 번호에 + 1을해서 비교하자
                if consecutiveArr[0] + 1 == consecutiveArr[1] && consecutiveArr[1] + 1 == consecutiveArr[2] {
                    print("숫자가 연속해서 3회 입력되었습니다...")
                    return true
                } else {
                    consecutiveArr.remove(at: 0)
                }
            }
        }
        return false
    }
}
var myPatternIDcheck = PatternIDcheck()
