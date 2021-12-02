//
//  ViewController.swift
//  calculatorVersion2
//
//  Created by 이건행 on 2021/12/02.
//

import UIKit

class ViewController: UIViewController {
    var stackLB = 0

    @IBOutlet weak var currentLB: UILabel!
    @IBOutlet weak var stack5: UILabel!
    @IBOutlet weak var stack4: UILabel!
    @IBOutlet weak var stack3: UILabel!
    @IBOutlet weak var stack2: UILabel!
    @IBOutlet weak var stack1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //버튼을 누를 때마다 입력한 값은 결과 Label에 표시한다.
    
    @IBAction func eventFrombutton(_ sender: UIButton) {
        guard let readValue = sender.titleLabel?.text else {
            print("You enter the wrong inputvalue")
            return
        }
        if currentLB?.text?.count == 19{
            print("Double of Numbers that can be entered are 18 characters long.")
            return
        }
        if stackLB >= 5 {
            print("stack is full")
            return
        }
        
        
    }
    
    
    
    
}

