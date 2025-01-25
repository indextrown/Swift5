//
//  ViewController.swift
//  UpDownGame
//
//  Created by Allen H on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 랜덤으로 숫자 선택(1...10)
    var comNumber = Int.random(in: 1...10)
       
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 메인레이블에 "선택하세요"
        mainLabel.text = "선택하세요"
        
        // 2) 숫자 레이블은 ""(빈문자열)
        numberLabel.text = ""
    }
    
    // 숫자 버튼 누르면 이벤트
    // 함수를 실행시키는 파라미터(UIButton) = 버튼 이라고 생각하자
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야함
        guard let numString = sender.currentTitle else {return}
        
        // 2) 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = numString
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 메인레이블 "선택하세요"
        mainLabel.text = "선택하세요"
        // 2) 숫자레이블 "" (빈문자열)
        numberLabel.text = ""
        // 3) 컴퓨터의 랜덤숫자를 다시 선택하게 한다
        comNumber = Int.random(in: 1...10)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 숫자레이블에 있는 문자열 가져오기
        guard let myNumString = numberLabel.text else {
            mainLabel.text = "선택되지 않았어요"
            return
        }
        // 타입 변환(문자열 ---> 정수)
        guard let myNumber = Int(myNumString) else {
            mainLabel.text = "선택되지 않았어요"
            return
        }
        
        
        if comNumber > myNumber {
            mainLabel.text = "UP"
        } else if comNumber < myNumber {
            mainLabel.text = "DOWN"
        } else {
            // control + command + spacebar
            mainLabel.text = "BINGO😎"
        }
    }
}


