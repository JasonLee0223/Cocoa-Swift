//
//  ViewController.swift
//  EnterPassword
//
//  Created by 이건행 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TitlePassword: UILabel!
    
    @IBOutlet weak var PasswordInput: UITextField!
    
    @IBOutlet weak var Level: UIView!
    
    @IBOutlet weak var Description: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func CheckButton(_ sender: UIButton) {
        guard let input = PasswordInput.text, input.count > 0 else {
            return
        }
        let passwordLevel = passwordValidator(password: input)
        changeLabelColor(level: passwordLevel)
    }
    
    // View Controller 클래스에 입력 암호를 분석해서 다음 레벨을 리턴하는 메서드를 만든다.
    func passwordValidator(password: String) -> Int{
        
        let pwSet = CharacterSet(charactersIn: password)
        let onlyDecimal = CharacterSet.decimalDigits    // level 1
        let onlyEnglish = CharacterSet(charactersIn: "a"..."z").union(CharacterSet(charactersIn: "A"..."Z")) // level2
        let onlyEnglishAndDecimal = onlyEnglish.union(onlyDecimal) // level4
        let specialCharacters = CharacterSet(charactersIn: "-+!@#$%") // level5
        
        // level5 영문자와 숫자, 특수문자가 한 개 이상씩 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호
        if !pwSet.isDisjoint(with: onlyEnglish) &&
            !pwSet.isDisjoint(with: onlyDecimal) &&
            !pwSet.isDisjoint(with: specialCharacters) &&
            password.count >= 8 { return 5 }
        
        //level4 영문자와 한 개 이상의 숫자로만 구성되어 있고 길이 8글자 이상 : 강한 암호
        else if !pwSet.isDisjoint(with: onlyEnglish) &&
                !pwSet.isDisjoint(with: onlyDecimal) &&
                pwSet.isSubset(of: onlyEnglishAndDecimal) &&
                password.count >= 8 { return 4 }
        
        // level2 영문자로만 구성되고 길이가 8글자 미만 : 약한 암호
        else if pwSet.isSubset(of: onlyEnglish) &&
                password.count < 8 { return 2 }
        
        // level1 숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호
        else if pwSet.isSubset(of: onlyDecimal) &&
                password.count < 8 { return 1 }
        else { return 3 }
    }
    
    func changeLabelColor(level: Int) {
        switch level {
        case 1:
            Level.backgroundColor = UIColor.red
            Description.text = "아주 약한 암호"
        case 2:
            Level.backgroundColor = UIColor.orange
            Description.text = "약한 암호"
        case 3:
            Level.backgroundColor = UIColor.yellow
            Description.text = "보통 암호"
        case 4:
            Level.backgroundColor = UIColor.blue
            Description.text = "강한 암호"
        case 5:
            Level.backgroundColor = UIColor.green
            Description.text = "아주 강한 암호"
        default:
            Level.backgroundColor = UIColor.lightGray
            Description.text = " 암호 수준"
        }
    }
}

