//
//  연습문제3 비밀번호 등급확인.swift
//  2Week_Monday
//
//  Created by 이건행 on 2021/11/10.
//
/*
 숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호(1 Level)
 영문자로만 구성되고 길이가 8글자 미만 : 약한 암호 (2 Level)
 나머지 경우는 : 보통 암호 (3 Level)
 영문자와 한 개 이상의 숫자로 구성되어 있고 길이 8글자 이상 : 강한 암호 (4 Level)
 영문자와 숫자, 특수문자로 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호 (5 Level)
*/

import Foundation

struct CheckPW{

    func passwordValidator(password: String) -> Int {
        
        let checkOfpwSet = CharacterSet(charactersIn: password)
        
        let OnlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z"))
        let Onlydecimal = CharacterSet.decimalDigits
        let specialChar = CharacterSet(charactersIn: "~!@#$%^&*")
        
        if password.count >= 8 {
            if !checkOfpwSet.isDisjoint(with: OnlyEnglish) && !checkOfpwSet.isDisjoint(with: Onlydecimal) && !checkOfpwSet.isDisjoint(with: specialChar) { return 5 }
            else if
                !checkOfpwSet.isDisjoint(with: OnlyEnglish) && !checkOfpwSet.isDisjoint(with: Onlydecimal) { return 4 }
        }   // ! -> not 연산자
        else
        {
            if checkOfpwSet.isDisjoint(with: OnlyEnglish) { return 2 }
            else if checkOfpwSet.isDisjoint(with: Onlydecimal) { return 1 }
        }
        return 3
    }
}
var myCheckPW = CheckPW()

