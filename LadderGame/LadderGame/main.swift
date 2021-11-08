//
//  main.swift
//  LadderGame
//
//  Created by 이건행 on 2021/11/04.
//
/*
    사다리 높이는 4개라고 가정한다.
    참여 인원과 높이를 매개변수로 받아서 사다리를 출력하는 printLadder() 함수를 구현한다.
    가로 개수는 참여 인원 - 1, 세로 개수는 사다리 높이와 동일한 Int 타입 2차원 배열을 만들고
    Int.random()으로 랜덤하게 사다리 발판이 있으면 -를 출력하고, 없으면 공백을 출력한다.
    발판 사이에는 |로 표시한다. 실행해서 콘솔에 출력되는지 확인한다.
*/
import Foundation

struct LadderGame1{
    
    // 사다리 인원 입력
    static func inputTo() -> Int{
        print("사다리게임에 참가 인원 수를 입력하세요 (2 ~ 7명): ", terminator: " ")
        
        let Member = readLine() ?? ""
        let inputMember: Int = Int(Member) ?? -1
        /*
        if inputMember < 2 && inputMember > 8 {
            print("잘못된 인원 수 입력입니다")
        }
        return -1
         */
        switch inputMember {
                case ...1:
                    print("참여 인원은 2명 이상이어야 합니다.")
                case 8...:
                    print("참여 인원은 7명 이하여야 합니다.")
                default:
                    return inputMember
                }
                
                return -1
    }

    
    // 사다리 출력하기
    static func printLadder(player: Int, height: Int){
        let row = player - 1
        let column = height
        
        var tempArr = [[Int]]()
        tempArr = Array(repeating: Array(repeating: 0, count: row), count: column)
        
        for i in 0..<column{
            for j in 0..<row{
                tempArr[i][j] = Int.random(in: 0...1)
            }
        }
        
        for i in 0..<column{
            for j in 0..<row{
                if j == 0 {
                print("|", terminator: "")
                }
                if tempArr[i][j] == 0{
                print("-|", terminator: "")
                }
                else {
                print(" |", terminator: "")
                }
            }
        print("")
        }
    }
}
let inputMember: Int = LadderGame1.inputTo()
if inputMember != -1 {
    LadderGame1.printLadder(player: inputMember, height: 4)
}


/*
 
/* 2차원 배열 만들기 예제 */
struct ArrayPractice{
    // 출력하는 함수 부분만 구현
    func printArray(array : Array<Array<Int>>) {
        for innerArray in array {
            for item in innerArray {
                print(item, terminator:" ")
            }
            print()
        }
    }
    // 계산하는 함수 부분만 구현
    func tempArray(lines: Int) -> Array<Array<Int>>{
        var resultArray = Array<Array<Int>>()
        for _ in 1...lines {
            var tempArray = Array<Int>()
            for xloop in 1...lines{
                tempArray.append(xloop)
            }
            resultArray.append(tempArray)
        }
        return resultArray
    }
}
// 호출하는 다른 방법
var arrayPractice = ArrayPractice()
arrayPractice.printArray(array: arrayPractice.tempArray(lines: 5))

*/
