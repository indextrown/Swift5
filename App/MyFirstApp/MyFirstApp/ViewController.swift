//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 김동현 on 7/10/24.
//

/*
화면 하나당 화면 하나를 관리하는 코드가 있다(기본 원리)
ViewController는 기본 설정된 화면과 연결되어 있다
 
 정리
 - 인터페이스 빌드는 모든 코드를 쉽게 설정할 수 있다. 보기 쉽게 만들 수 있다
 - 모든 것을 코드로 만들 수 있다
 */

import UIKit

class ViewController: UIViewController {
    // IB: interface builder에 대한 outlet(배출구)
    
    //UILabel: 타입, apple이 미리 개발자들 쓰기 편하도록 만들어둠
    @IBOutlet weak var mainLabel: UILabel!
    // 변수로 만들어야 접근해서 내부 속성 변경 가능
    @IBOutlet weak var myButton: UIButton!
    
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad() // 함수실행
        
        // 기존의 인터페이스 빌더에서 보여주기 위한 초기설정 위에 덮어씀
        //mainLabel.text = "hello"
        //mainLabel.backgroundColor = UIColor.yellow
        
    }

    // 버튼을 누르면 함수가 실행된다
    // interface builder action: 헹동이 전달된다
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요"
        
        myButton.backgroundColor = UIColor.yellow
        myButton.setTitleColor(UIColor.black, for: UIControl.State.normal)// 보통상태
        
        // 리터럴 선택방법
        // mainLabel.backgroundColor = #colorLiteral(
        
        /*
        mainLabel.backgroundColor = UIColor.yellow
        mainLabel.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        // 열거형 타입 NSTextAlignment
        mainLabel.textAlignment = NSTextAlignment.right
         */
    }
}

