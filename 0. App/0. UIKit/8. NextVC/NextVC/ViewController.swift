//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        // 인스턴스를 찍어낸다 = 메모리에 올라간다
        let firstVC = FirsstViewController()
        firstVC.someString = "첫번째 화면"
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {

        // 스토리보드로 secondViewController 만들었기 때문에 heap영역에 controller, story 각각 따로 존재
        // as? SecondViewController는 타입캐스팅하여 SecondViewController로 해주는것
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.someString = "두번째 화면"
        present(secondVC, animated: true, completion: nil)
    }
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        

    }
    

    
}

