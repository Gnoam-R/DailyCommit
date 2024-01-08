//
//  ViewController.swift
//  tableView
//
//  Created by Roh on 1/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    var showData: [JsonData]?
    let stringData =
    """
    [
        {
            "name": "알버트 아인슈타인",
            "occupation": "이론 물리학자",
            "birthplace": "독일",
            "works": "상대성 이론"
        },
        {
            "name": "마하트마 간디",
            "occupation": "독립 운동 지도자",
            "birthplace": "인도",
            "works": "비폭력 저항"
        },
        {
            "name": "마더 테레사",
            "occupation": "로마 가톨릭 수녀",
            "birthplace": "알바니아",
            "works": "가난한 이들 돕기"
        }
    ]
    """
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
        showData = [JsonData]()
        let decoder = JSONDecoder()
        
        print(stringData)
        guard let jsonData = stringData.data(using: .utf8) else {
            print("stop----1")
            return
        }
        do {
            let object = try decoder.decode([JsonData].self, from: jsonData)
            showData = object
        } catch {
            return
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var result: String?
        switch section {
        case 0: 
            result = showData?[0].name
            break
        case 1:
            result = showData?[1].name
            break
        case 2:
            result = showData?[2].name
            break
        default:
            result = nil
        }
        return result
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        showData!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = showData?[indexPath.section].occupation
//            cell?.backgroundColor = .red
            break
        case 1:
            cell?.textLabel?.text = showData?[indexPath.section].birthplace
            break
        case 2:
            cell?.textLabel?.text = showData?[indexPath.section].works
            break
        default:
            break
        }
        return cell!
    }
    
}

