//
//  ViewController.swift
//  Measure-Practice
//
//  Created by 이건행 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var resultValue: UILabel!
    // weak var는 시스템 내부에서 자체적으로 메모리에서 제거할 수 있음
    // var는 앱 종료전까지 메모리가 제거되지 않음
    //@IBOutlet weak var
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ConvertToUnit(_ sender: UIButton) {
        if let inputValue = Double(inputNum.text!)
        {
            /*
             let measureValues = Measurement(value: inputValue, unit: UnitLength.meters)
                .converted(to: <#T##UnitLength#>.inches)
        */}
    }
    
    
    
}
