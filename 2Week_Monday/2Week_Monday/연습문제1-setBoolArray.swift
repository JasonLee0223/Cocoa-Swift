//
//  연습문제1-setBoolArray.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//

import Foundation

struct ArrayPractice2{
    
    func printArray(boolOfArray: Array<Array<String>>, newChar: Character){
        
        for rowBool in 0...6 {
            for colBool in 0...6{
                if boolOfArray[rowBool][colBool] == "f" {
                    print(" ", terminator: " ")
                } else {
                    print(newChar, terminator: " ")
                }
            }
            print(" ")
        }
    }
    
    func setBoolArray() -> Array<Array<String>>{
        // reapeating을 Character로 사용할 수 있다.
        var boolArr = Array(repeating: Array(repeating: "f", count: 7), count: 7)
        
        for row in 0...6 {
            for col in (6-row)...6 {
                boolArr[row][col] = "t"
            }
        }
        //print(boolArr)
        return boolArr
    }
}

var boolArr = ArrayPractice2()
