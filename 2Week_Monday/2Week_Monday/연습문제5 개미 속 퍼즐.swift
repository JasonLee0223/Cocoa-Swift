//
//  연습문제5 개미 속 퍼즐.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//
/*
- 직전값을 보관하는 변수를 선언한다 (초기값은?)
- 개수를 보관하는 변수를 선언한다 (초기값은?)

- 결과를 저장해서 리턴할 배열 변수를 선언한다
- inputArray 아이템 개수만큼 반복한다
- 아이템 값이 직전값과 같은지 비교한다
- 같으면 개수를 하나 증가한다
- 다르면 직전값과 현재 개수를 배열에 저장한다. 직전값을 아이템 값으로 변경한다.
- 결과 배열 변수를 리턴한다
*/

import Foundation

struct AntPuzzle{
    func antFunction(inputArray: Array<Int>) -> Array<Int> {
        var previousVal = inputArray[0]
        var count = 0
        
        var returnArr: Array<Int> = []
        
        for item in 1...inputArray.count {
            if previousVal == item {
                    count += 1
            } else {
                returnArr.append(previousVal)
                returnArr.append(count)
                previousVal = item
                count = 1
            }
        }
        returnArr.append(previousVal)
        returnArr.append(count)
        
        return returnArr
    }
    
    func printAntFunction(antArr: [Int], lines: Int) {
        var inputArr = antArr
        for _ in 1...lines {
            print(inputArr)
            inputArr = antFunction(inputArray: inputArr)
        }
    }
}
var myAntPuzzle = AntPuzzle()

