//
//  ViewController.swift
//  calculator
//
//  Created by 이건행 on 2021/12/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var holder: UIView!
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Arial", size: 42)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupNumberPad()
    }
    
    private func setupNumberPad() {
        let buttonSize:CGFloat = view.frame.size.width / 4
        
        let horizontal = ["0", ".", "="]
        for x in 0..<3 {
            let button0 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize * 4), width: buttonSize, height: buttonSize))
            button0.setTitleColor(.black, for: .normal)
            button0.backgroundColor = .yellow
            button0.setTitle(horizontal[x], for: .normal)
            holder.addSubview(button0)
        }
        
        for x in 0..<3 {
            let button1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize * 7), width: buttonSize, height: buttonSize))
            button1.setTitleColor(.black, for: .normal)
            button1.backgroundColor = .yellow
            button1.setTitle("\(x+1)", for: .normal)
            holder.addSubview(button1)
        }
        
        for x in 0..<3 {
            let button2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize * 6), width: buttonSize, height: buttonSize))
            button2.setTitleColor(.black, for: .normal)
            button2.backgroundColor = .yellow
            button2.setTitle("\(x+4)", for: .normal)
            holder.addSubview(button2)
        }
        
        for x in 0..<3 {
            let button3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x), y: holder.frame.size.height-(buttonSize * 5), width: buttonSize, height: buttonSize))
            button3.setTitleColor(.black, for: .normal)
            button3.backgroundColor = .yellow
            button3.setTitle("\(x+7)", for: .normal)
            holder.addSubview(button3)
        }
        
        let operation = ["÷", "x", "-", "+"]
        for x in 0..<4 {
            let buttonOP = UIButton(frame: CGRect(x: buttonSize * 3, y: holder.frame.size.height-(buttonSize * CGFloat(x+4)), width: buttonSize, height: buttonSize))
            buttonOP.setTitleColor(.black, for: .normal)
            buttonOP.backgroundColor = .orange
            buttonOP.setTitle(operation[x], for: .normal)
            holder.addSubview(buttonOP)
        }
        
        resultLabel.frame = CGRect(x: 20, y: 10, width: view.frame.size.width, height: 100)
        holder.addSubview(resultLabel)
        
        //MARK: Action
        
    }
}

