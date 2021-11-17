//
//  ViewController.swift
//  Measure-Practice
//
//  Created by 이건행 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputValue: UITextField!
    @IBOutlet weak var printLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func convert(_ sender: Any) {
      
        guard let userInputValue = inputValue.text, userInputValue.count > 0 else{
            return
        } //.text 와 .count에 대하여 찾아볼 것 -> 아마 textfield 사용에 관해 찾아보면될듯?
        
        guard let userInputUnit = Double(userInputValue) else {
            return
        } // Measurement 메소드 value 인스턴스에 Double 타입으로 전달해야하므로 타입변환
        /* Initializer 'init(_:)' requires that 'UITextField' conform to 'StringProtocol' ?? */
        
        let userMeters = Measurement(value: userInputUnit, unit: UnitLength.centimeters)
        
        let convertUnit = userMeters.converted(to: UnitLength.inches)
        // convert 와 converted 차이점 찾아보기
        let result = String(format: "%.21f inch", convertUnit.value)
        
        printLabel.text = result
    }
}
