//
//  연습문제6 사전 활용하기.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//

import Foundation

func duplicatedWords(inputWords: [String]) -> [String] {
    var compareDic = [String : String]()  // Dictionary 사용
    var outOfdic = [String]()

    //for (key,value) in compareDic -> 이렇게 사용할 수 없을까...? 옵셔널바인딩과 관련..?
    /*
        if compareDic.isEmpty && outOfdic.isEmpty {
            print("This array is empty", terminator: " ")
        } 입력값과 출력값에 값이 없는지 확인 -> 이렇게 확인해 볼 수 없을까...?
    */
    
    // nil에 대해 공부필요 -> 11.11(목) Notion일지에 정리완료
    for word in inputWords {
        if compareDic[word] != nil && outOfdic.contains(word) == false {
            outOfdic.append(word)
        }
        compareDic[word] = "value"
    }
    return outOfdic
}
