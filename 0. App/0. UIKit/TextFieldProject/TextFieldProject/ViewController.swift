//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 김동현 on 2/14/25.
//

import UIKit

// 자격증에는 반드시 구현해야되는 필수 요구사항 존재.. 빨간줄안뜨면 선택적 요구사항으로 메서드가 정의됨..
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField: 인스턴스 객체
        // 텍스트필드의 delegate(대리자)를 viewController로 설정하겠다
        textField.delegate = self
        
        // UI
        setUp()
    }
    
    func setUp() {
        // view는 UIViewController 즉 상위클래서에 정의되있다.
        // ViewController에는 가장 하위에 기본적인 view가 하나 깔려있다.
        view.backgroundColor = UIColor.gray
        
        // 텍스트필드 키보드 스타일
        textField.keyboardType = UIKeyboardType.emailAddress
        
        // 텍스트필드 기본 문구
        textField.placeholder = "이메일 입력"
        
        // 텍스트필드 선 스타일
        textField.borderStyle = .roundedRect
        
        // x모양 클리어버튼 보이도록
        textField.clearButtonMode = .always
        
        // 엔터형태 지정 가능
        textField.returnKeyType = .go
    }
    
    // 텍스트 필드의 입력을 시작할때 호출 (시작할지 말지의 여부 허락하는 것) (자격증에는 선택사항)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 참과 거짓을 리턴하지 않는 메서드들은 대부분 시점을 의미
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다. ")
    }
    
    // 텍스트필드 정리를 허락할지 말지
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출되고.. 입력이될지 허락 여부도 가능
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)
        return true
    }
    
    // 텍스트필드의 엔터키가 눌러지면 다음 동작을 허락할것인지 말것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날 때 호출(끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드 입력이 끝났을 때 호출(시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 끝냈다. ")
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
}

