//
//  ViewController.swift
//  RPSGame
//
//  Created by 김동현 on 7/12/24.
//

import UIKit

// 클래스 내부에 코드를 작성해야함
class ViewController: UIViewController {

    // 화면과 연결된 변수(속성)
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    /* 데이터 저장을 위한 변수(컴퓨터 선택 / 나의 선택)*/
    // 맨처음에는 무조건 묵 설정
    var myChoice: Rps = Rps.rock
    // 맨 처음에는 컴퓨터의 랜덤값 설정 Rps(rawValue) -> 옵셔널 타입
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    // action
    // 함수 / 메서드
    // 앱의 화면에 들어오면 처음 실행되는  함수
    override func viewDidLoad() {
        super.viewDidLoad()
        /* 속성을 변경시키기 위해 속성에 접근해서 변경하는 부분 */
        
        // 1) 첫번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        // comImageView.image = #imageLiteral(
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄어야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    // 3개의 버튼 중 하나라도 입력해도 실행된다
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 3) 가위 바위 보(enum)를 선택해서 그 정보를 저장해야된다
        // 구별을 할 수 있어야함 -> 어떻게 ??? 파라미터를 활용 sender
        // 가위를 누르면 가위버튼을 눌렀다고 나옴-> 옵셔널 스트링타입 -> 무조건 벗겨야함
        //        guard let title  = sender.currentTitle else {
        //            return
        //        }
        
        // 버튼의 문자를 가져옴
        // let title = sender.currentTitle!
        // 우아한 방식
        guard let title = sender.currentTitle else { return } // 만족하지 않으면 벗아남
        
        // 버튼의 문자열 비교
        switch title {
        case "가위":
            // 정보를 저장해야 컴퓨터 랜덤값과 비교 가능 (myChoice 변수를 만들어야함)
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        // 문자열이기 때문에 모든 케이스를 다루고 있지 않아서 작성해줘야함
        default:
            break
        }
    }
    
    // SELECT 버튼 동작
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        // 3) 내가 선택한 것을 이미지뷰애 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단 후 표시한다
        if comChoice == myChoice {
            mainLabel.text = "무승부입니다"
        } 
        else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼습니다"
        }
        else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼습니다"
        } else {
            mainLabel.text = "졌습니다"
        }
    }
    
    // RESET 버튼 동작
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비 상태를 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 상태를 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 내가 선택 이미지뷰에도 준비 이미지를 표시
        // 4) 내가 선택 레이블에도 준비 문자열 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인 레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
}


