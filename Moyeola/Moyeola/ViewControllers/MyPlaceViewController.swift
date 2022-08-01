//
//  MyPlaceViewController.swift
//  Moyeola
//
//  Created by 이유나 on 2022/08/01.
//

import UIKit

class MyPlaceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var title_data:[String] = []
    var date_data:[String] = []
    var place_data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // '+' 버튼 클릭 시 일정 추가하는 팝업창 띄우기
    @IBAction func btnAdd(_ sender: Any) {
        
        // 팝업창
        let scheduleAlert = UIAlertController(title: "추가할 일정 내용을 입력하세요.", message: nil, preferredStyle: .alert)
        
        scheduleAlert.addTextField { (myTextField) in
            myTextField.placeholder = "모임 이름"
        }
        scheduleAlert.addTextField { (myTextField) in
            myTextField.placeholder = "날짜"
        }
        scheduleAlert.addTextField { (myTextField) in
            myTextField.placeholder = "장소"
        }
        
        // 팝업창의 추가 버튼
        scheduleAlert.addAction(UIAlertAction(title: "추가", style: .default, handler: { (add) in
            
            guard let titleText = scheduleAlert.textFields?[0].text, titleText != "" else {
                return
            }
            guard let dateText = scheduleAlert.textFields?[1].text, dateText != "" else {
                return
            }
            guard let placeText = scheduleAlert.textFields?[2].text, placeText != "" else {
                return
            }
            
            self.title_data.append(titleText)
            self.date_data.append(dateText)
            self.place_data.append(placeText)
            self.tableView.reloadData()
        }))
        // 팝업창의 취소 버튼
        scheduleAlert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(scheduleAlert, animated: true, completion: nil)
    }
    
    
}

// TableView 행과 열 관련 속성
extension MyPlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! scheduleCell
        let row = indexPath.row
        
        cell.titleLabel.text = "\(title_data[row])"
        cell.dateLabel.text = "날짜       \(date_data[row])"
        cell.placeLabel.text = "장소       \(place_data[row])"
        
        return cell
    }
}

// TableView 높이 속성
extension MyPlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
    }
}
