//
//  연습문제2-숫자야구게임구조체.swift
//  2Weak_Wed
//
//  Created by 이건행 on 2021/11/15.
//
/*
 숫자 야구 게임이란 2명이 서로가 생각한 숫자를 맞추는 게임이다.
 각자 서로 다른 1~9까지 3자리 임의의 숫자를 정한 뒤 서로에게 3자리의 숫자를 불러서 결과를
 확인한다. 그리고 그 결과를 토대로 상대가 정한 숫자를 예상한 뒤 맞힙니다.
 
 - 숫자와 위치가 모두 틀렸을 때: Out
 A: 123
 B: 1strike 1 ball
 A: 356
 B: 1strike 0ball
 */

import Foundation
//3자리 숫자 야구게임(수비)을 위해서, 다음 메소드를 포함하는 구조체 만들기
struct Baseball {
// newGame function에서 리턴값을 모두 접근해야해서 private를 쓰는 것 같다... 학습 필요 -> 접근제어 -> 정답을 감추기 위해서??
 private var compareArrFirst: Int = 0
 private var compareArrSecond: Int = 0
 private var compareArrThird: Int = 0
//    var compareArrFirst: Int = 0
//    var compareArrSecond: Int = 0
//    var compareArrThird: Int = 0
    
    //임의의 3자리 숫자 생성해서 내부 프로퍼티에 저장
     mutating func newGame() {
        var compareArr = [Int]()
        
        for _ in 0...2 {
            var discriminateNum = 0
            
            while compareArr.contains(discriminateNum) {
                discriminateNum = Int.random(in: 0...9)
            }
            compareArr.append(discriminateNum)
        }
        // self error가 나면서 mutating 사용해야하는 이유 알아보기
        //Cannot assign to property: 'self' is immutable
        //Mark method 'mutating' to make 'self' mutable
        compareArrFirst = compareArr[0]
        compareArrSecond = compareArr[1]
        compareArrThird = compareArr[2]
    }
    
    //3자리 숫자를 비교 후 결과(숫자 위치까지 맞춘 경우, 위치만 다른 경우)를 리턴
    func hit(num:Int) -> (strikeCount:Int, ballCount:Int){
        var countOfstrike = 0
        var countOfball = 0
        
        // 입력값 10단위로 확인, 123 = 1은 100으로 나눈 몫 / 2는 100자리를 제외한 10으로 나눈 몫 / 3은 10으로 나눈 나머지
        let inputFirNum = num / 100
        let inputSecNum = (num % 10) / 10
        let inputThrNum = num / 10
        
        // 게임 안에서의 값과 입력값이 같은지 확인
        let inputArr: [Int] = [inputFirNum, inputSecNum, inputThrNum]
        let compareArr: [Int] = [compareArrFirst, compareArrSecond, compareArrThird]
        
        // - 숫자와 위치가 모두 맞을 때: Strike
        for i in 0..<inputArr.count {
            if inputArr[i] == compareArr[i] { countOfstrike += 1}
        }
        // 3strike -> out 조건 추가
        if countOfstrike == 3 {
            let result = (countOfstrike, countOfball)
            return result
        }
        
        // - 숫자는 맞지만, 위치가 틀렸을 때: Ball
        for i in 0..<inputArr.count {
            for j in 0..<inputArr.count {
                if i == j { continue }
            }
            if inputArr[i] == compareArr[i] { countOfball += 1}
        }
        
        let result = (countOfstrike, countOfball)
        return result
    }
    
    //9번내에 스트라이크 3개 모두 맞췄으면 성공(true). 아니면 실패(false)
    func showGameScore() -> Bool {
        var inning = 9
        print("정답: \(compareArrFirst)\(compareArrSecond)\(compareArrThird)")
        print("3자리 숫자 ㅁㅁㅁ를 맞추세요. 기회는 \(inning)이닝 주어집니다")

        while inning != 0 {
            let inputNum = Int(readLine() ?? "") ?? 0
            let gameResult = self.hit(num: inputNum)
            if gameResult == (3, 0) {
                print("3strike 정답을 맞추셨습니다.")
                return true
            } else {
                inning -= 1
                print("\(gameResult) 남은 이닝: \(inning)")
            }
        }
        print("#### Game Over ####")
        print("정답: \(compareArrFirst)\(compareArrSecond)\(compareArrThird)")
        return false
    }
}
