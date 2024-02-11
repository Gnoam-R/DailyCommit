//
//  ViewController.swift
//  URLImageVIew
//
//  Created by Roh on 2/7/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonPress: UIButton!
    var receivedData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonPressed(_ sender: Any) {
        let url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")!
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        session.dataTask(with: url).resume()
    }
}


extension ViewController: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        if receivedData == nil {
            receivedData = Data()
        }
//        receivedData?.append(data)
        receivedData?.append(data)
        
        if let receivedData = receivedData,
           let image = UIImage(data: receivedData as Data) {
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
