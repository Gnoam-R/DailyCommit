//
//  ViewController.swift
//  CollectionView
//
//  Created by Roh on 2/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewLayout()   // 추상클래스
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal    // 가로로 흐를수 있음
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        return collectionView
    }()
        
//    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        
        let numberLabel = UILabel()
        numberLabel.text = indexPath.row.description
        numberLabel.textColor = .white
        numberLabel.textAlignment = .center
        
        cell.contentView.addSubview(numberLabel)
        numberLabel.frame = cell.bounds
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
        let randomWidth = Int.random(in: 1...100)
        let randomHeight = Int.random(in: 1...100)
        return CGSize(width: randomWidth, height: randomHeight)
    }
}
