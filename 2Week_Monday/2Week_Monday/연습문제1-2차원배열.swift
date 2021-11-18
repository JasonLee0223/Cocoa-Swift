//
//  연습문제1-2차원배열.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//
/*
 아래의 코드를 사용
 var myArray = ArrayPractice()
 myArray.printArray(array:myArray.fillArray())
*/

import Foundation

struct ArrayPractice{
    
    func printArray(array: Array<Array<Int>>) {
        for i in 0...4 {
            print(array[i][0...i])
            // 1행에서는 1번째, 2행에서는 2번째, ... ,5행에서는 5개까지 나타날 수 있게 출력한다.
        }
    }
    
    func fillArray() -> Array<Array<Int>> {
        var myArray = Array(repeating: Array(repeating: 0, count: 5), count: 5)
        var lines = 1
        
        for i in 0...4 {
            for j in 0...4 {
                myArray[i][j] = lines
                lines += 1
            }
        }
        //print(myArray)
        return myArray
    }
}

var myArray = ArrayPractice()
