//
//  ViewController.swift
//  TableView_study
//
//  Created by Roh on 1/8/24.
//

import UIKit

class ViewController: UIViewController {

    var resultValue: [Int] = [0, 1, 2, 3]
    
    @IBOutlet weak var myTableVIew: UITableView!
    var selectedIndexPaths = NSMutableSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableVIew.dataSource = self
        self.myTableVIew.delegate = self
        
        myTableVIew.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    }
}
class CustomCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = nil
    }
}


extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        
        let address = Unmanaged.passUnretained(cell).toOpaque().debugDescription
        
        if selectedIndexPaths.contains(indexPath) {
            cell.backgroundColor = .red
        }
        cell.textLabel?.text = address
        print("cell: \(indexPath.row)")
        if indexPath.row == 0 {
            cell.backgroundColor = .red
        }
//        else {
//            cell.backgroundColor = .clear
//        }
        return cell
    }
    
}
