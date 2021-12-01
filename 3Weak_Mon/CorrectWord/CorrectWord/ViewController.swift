//
//  ViewController.swift
//  CorrectWord
//
//  Created by 이건행 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    // 전체 단어 목록은 10개로 임의로 코드에 상수로 입력해서 준비한다.
    var words = ["동해물과", "백두산이", "마르고", "닳도록", "하느님이", "보우하사", "우리나라", "만세", "무궁화", "삼천리"]
    var count = 0 //추가 미션을 위해서 앞뒤 확인 변수
    
    //Label 을 두 개 표시한다. 하나는 현재 입력할 단어, 다른 하나는 다음에 입력할 단어를 표시한다.
    @IBOutlet weak var inputWord: UILabel!
    @IBOutlet weak var outputWord: UILabel!
    @IBOutlet weak var inputValue: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.inputValue.placeholder = "값을 입력하세요."
        self.inputValue.keyboardType = UIKeyboardType.namePhonePad // 키보드 타입 한글 패드로
        self.inputValue.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일 어둡게
        self.inputValue.returnKeyType = UIReturnKeyType.done
        self.inputValue.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화 On
    }
    
//    확인 버튼을 누르면 현재 TextField에 입력한 단어와 Label에 표시한 단어를 비교
//    같으면 다음 단어를 현재 단어로 옮기고, 다음 단어를 표시한다.
    @IBAction func changeButton(_ sender: UIButton) {
        guard let input = inputValue.text, input.count > 0 else {
            return
        }
        
        if input == words[count]{
            inputWord.textColor = UIColor.black
            outputWord.textColor = UIColor.black
            count += 1
            
            // 입력한 값이 다르면 TextField만 지운다.
            if count == words.count{
                inputWord.text = "clear blank"
                inputValue.text = ""
                return
            } else {
            // 같으면 다음 단어를 현재 단어로 옮기고
            inputWord.text = words[count]
            }
            if count == words.count - 1 {
                outputWord.text = ""
            } else {
                outputWord.text = words[count + 1]
            }
            inputValue.text = ""
        } else {
            inputWord.textColor = UIColor.red
            outputWord.textColor = UIColor.red
            inputValue.text = ""
            return
        }
    }
}
