//
//  ViewController.swift
//  CollectionViewCarouselLayout
//
//  Created by macadmin on 19/03/20.
//  Copyright © 2020 Mahesh Gahlot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testCollectionView: UICollectionView!
    var items: [Int] = [Int](1..<30)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        
    }

    func setupCollectionView() {
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = (layout.itemSize.height * 0.2)
        layout.headerReferenceSize = CGSize(width: 0, height: 40)
        layout.sectionInset = UIEdgeInsets(top: 250, left: 0, bottom: 50, right: 0)
        testCollectionView.collectionViewLayout = layout
        testCollectionView.dataSource = self
        testCollectionView.delegate = self
    }
}


extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testCollectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
       cell.backgroundColor = UIColor.red
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}




