//
//  ViewController.swift
//  waitingNumManage
//
//  Created by 이건행 on 2021/12/01.
//
import UIKit

class ViewController: UIViewController {
    
    var waitingPersonCount:Int = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var countPersonLB: UILabel!
    @IBOutlet weak var waitBT: UIButton!
    @IBOutlet weak var subtractPress: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func waitBT(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        if title == "대기" {
            waitingPersonCount += 1
        } else if title == "완료" {
            waitingPersonCount -= 1
        }
        renewalEnable()
        updateTitleLB()
        reloadProgress()
        
    }
    
    func renewalEnable() {
        //@IBOutlet weak var waitBT: UIButton! 이 문장이 생겨서 사용가능... 왜일까...
        self.waitBT?.isEnabled = waitingPersonCount < 20
        countPersonLB.textColor = UIColor.black
        print(waitingPersonCount < 20)
        
        // 대기 인원이 20명 미만일 경우는 검정색으로, 20명이 되면 빨간색으로 표시한다.
        if waitingPersonCount == 20 {
            countPersonLB.textColor = UIColor.red
        }
        
        self.subtractPress?.isEnabled = waitingPersonCount > 0
        //단, 최대 대기 인원은 20명으로 제한한다. 20명이 되면 [대기] 버튼을 비활성화(disable) 한다.
        //단, 0명 이하로 내려갈 수는 없다. 대기자가 1명 이상일 경우만 [완료]버튼을 활성화(enable) 한다.
    }
    
    func updateTitleLB() {
        countPersonLB.text = "\(waitingPersonCount) 명"
    }
    
    func reloadProgress() {
        progressBar.setProgress(Float(waitingPersonCount) / 20.0, animated: true)
    }
}

