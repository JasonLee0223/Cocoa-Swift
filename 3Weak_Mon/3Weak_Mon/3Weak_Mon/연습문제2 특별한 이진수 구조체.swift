//
//  연습문제2 특별한 이진수 구조체.swift.swift
//  3Weak_Mon
//
//  Created by 이건행 on 2021/11/22.
//

import Foundation


struct specialBinary{
    //var count computed property는 values 배열의 count를 return 한다.
    private var values = [String]()
    
    var count: Int {
        get{
            return values.count
        }
    }
    
    //total 값과 같은 비트 길이를 가지는 2진수 숫자를 생성해서 내부 private values 배열에 초기화한다.
    init(with total : Int) {
        var maxCount = 0
        
        while true {
            let binary = String(maxCount, radix: 2) // 10진수 -> 2진수로 변경
            
            if binary.count > total {
                break
            } else {
                values.append(binary)
                maxCount += 1
            }
        }
        // values 배열에 2진수 값들이 int타입으로 count갯수만큼 차있게된다.
        
        // 이 부분은 이해가 안됨...
        for i in 0..<count {
            let appendedBinaryCount = values[i].count
            let needZeroCount = values[values.endIndex - 1].count
            // values.endIndex의 값은 2진수일것같은데 여기서 -1을 하면 배열의 위치가 바뀌는건지 값이 바뀌는건지 모르겠다... 2ㅣㅈ
            let gap = needZeroCount - appendedBinaryCount   // 1 ??
            
            let addedZero = String(repeating: "0", count: gap)
            values[i].insert(contentsOf: addedZero, at: values[i].startIndex)
        }
    }
    //초기화한 values 배열 값 중에서 1인 비트 개수가 bitcount개 있는 값만
    //배열에 문자열로 담아서 return 한다.
    func find(by bitcount: Int) -> Array<String>{
        
        
    }
    
    func printCount () {
        print("count = \(count)")
    }
}
// 전체 비트 개수를 입력받는다.
//print(SpecialBinary.init(with: 5))

/* 동 작 예 시
 init(with: 5) //생성
 count = 32
 find(by: 3) =>
 [
 "00111",
 "01011",
 "01101",
 "01110",
 "10011",
 "10101",
 "10110",
 "11001",
 "11010",
 "11100"
 ]
 */
