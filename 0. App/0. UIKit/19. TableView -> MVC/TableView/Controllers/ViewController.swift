//
//  ViewController.swift
//  TableView
//
//  Created by 김동현 on 2/28/25.
//

import UIKit

// MARK: - 테이블 뷰 사용시 프로토콜 채택해야함 - UITableViewDataSource(tableView-viewController통신 프로토콜)
// tableView -> viewController: 셀(컨텐츠) 몇개 표시?
// tableView -> viewController: 셀에 대한 내부컨텐츠를 어떻게 표시?
// viewController -> tableView: 컨텐츠 10개표시, 내용물은 ~하게 표시해
final class ViewController: UIViewController {
    
    //var moviesArray: [Movie] = []
    private var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate와 유사함 but 이름만 dataSource라고 애플이 지정해둠
        tableView.dataSource = self // self는 viewController(테이블뷰의 대리자는 viewController이다)
        tableView.rowHeight = 120
        
        // 서버에서 데이터를 배열로 받아온다(여기서는 배열을 하드코딩으로 만듬)
        movieDataManager.movieDataa()
        
        // 매니저의 배열을 viewController의 배열로 할당
        // moviesArray = movieDataManager.getMovieData()
    }
}

// 일반적으로 프로토콜을 채택해서 메서드구현시 가독성을 위해 확장을 한다
extension ViewController: UITableViewDataSource {
    
    // 몇개의 컨텐츠를 만들면 되는지 알려주는 메시지(tableView가 viewController에게 물어보는 내용이다)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    // 몇번째 행에있는 셀을 어떠한 방식으로 표시해라고 알려주는 메시지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 기존에 스토리보드로 만든 cell을 꺼내서 쓸거야. 문자열은 스토리보드 셀에 입력해두자.
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell // 타입캐스팅
        
        let array = movieDataManager.getMovieData()
        
        let movie = array[indexPath.row]
        
        // 코드 설정
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}
