//
//  ViewController.swift
//  http_example
//
//  Created by Roh on 2/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
//        myTableView.register(MyCell.self, forCellReuseIdentifier: "gnoamCell")
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
        
        if indexPath.section <= 4 {
            cell.textLabel?.text = "색션번호: \(indexPath.section), 줄번호: \(indexPath.row)"
        }

        let url: URL?
        switch indexPath.row {
        case 0:
            url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")
        case 1:
            url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1318341")
        case 2:
            url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1379801")
        default:
            url = nil
        }
        guard let resultURL = url else {
            return cell
        }

        
        let _ = URLSession.shared.dataTask(with: resultURL) { data, response, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                if indexPath == tableView.indexPath(for: cell) {
                    cell.imageView?.image = image
                }
            }
        }.resume()
        
        if indexPath.row == 2 {
            cell.backgroundColor = .red
        }
        
        return cell
    }
}

class MyCell: UITableViewCell {
    static let cellID = "gnoamCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.image = UIImage(systemName: "circle.fill")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        backgroundColor = .white
        imageView?.image = UIImage(systemName: "circle.fill")
    }
}
