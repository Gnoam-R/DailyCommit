//
//  ModalViewController.swift
//  Test_Cache
//
//  Created by 신동오 on 2024/03/04.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    
    // MARK: Private Property
    
    private let catUrlString = "https://i.kym-cdn.com/entries/icons/facebook/000/046/895/huh_cat.jpg"
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // disk cache(file) check
        guard let url = URL(string: catUrlString) else {
            return
        }
        
        NSCacheManager.shared.checkFile(url: url, completion: { [weak self] data in
            print("hello")
            DispatchQueue.main.async {
                self?.catImageView.image = UIImage(data: data)
            }
        })
    }
    
    // MARK: Functions
    @IBAction func bringCatButtonTapped(_ sender: UIButton) {
        // disk cache
        guard let url = URL(string: catUrlString) else {
            return
        }
        
        NSCacheManager.shared.loadImage(url: url, completion: { [weak self] data in
            DispatchQueue.main.async {
                self?.catImageView.image = UIImage(data: data)
            }
        })
    }
    
    
}
