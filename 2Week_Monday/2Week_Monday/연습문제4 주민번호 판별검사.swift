//
//  연습문제4 주민번호 판별검사.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//
import Foundation
/*
문제정의 : 주민등록번호 13자리를 문자열(-는 제외)로 입력받아
정상적인 검사해서 결과를 참-거짓으로 출력하는 함수
 
앞에서부터 12자리에 2~9, 2~5 각각의 상수값을 곱해서 전체를 더한다.
전체 더한 숫자를 11로 나눈 나머지를 구한다.
나머지 숫자를 11에서 빼서 10으로 나눈다.
위에서 구한 숫자와 마지막 13번째 자리가 같은지 비교한다.
*/

struct SocialSecurityNumber {
    
    func socialNumber (input: String) -> Bool {
        
        let lastNum = Int(String(input.last!)) ?? 0
        
        let inputValue = InputSocialNum(inputNum: input)
        let calculateNum = calculateSocialNum(sumInput: inputValue)
        let remainNum = remainValue(resultRemain: calculateNum)
        let resultNum = comparisonValue(resValue: remainNum, comparisonNum: lastNum)
        
        return resultNum
    }
    
    func InputSocialNum (inputNum: String) -> [Character] {
        let splitInput = inputNum.split(separator:"-")    // "123456","1234567"
        let arrInput = Array(splitInput[0]+splitInput[1])  // ["1",2,3,4,5,6,1,2,3,4,5,6,7]
        var returnInput = [Character]()
        returnInput = arrInput
        
        return returnInput
    }
    
    func calculateSocialNum (sumInput: [Character]) -> Int {
        var resultArr = [Int]()
        var resultSum = 0
        var multiplicationNum = 2
        
        for i in 0..<sumInput.count - 1 {
            if multiplicationNum == 10 { multiplicationNum = 2}
            resultArr.append(Int(String((sumInput[i])))! * multiplicationNum)
            multiplicationNum += 1
        }
        
        for j in 0..<resultArr.count {
            resultSum += resultArr[j]
        }

        return resultSum % 11
    }
    
    func remainValue(resultRemain: Int) -> Int {
        return (11 - resultRemain) % 10
    }
    
    func comparisonValue(resValue: Int, comparisonNum: Int) -> Bool {
        if resValue == comparisonNum {
            return true
        } else {
            return false
        }
    }
}
var practice4 = SocialSecurityNumber()
