//
//  ViewController.swift
//  TagLayout
//
//  Created by macadmin on 30/03/20.
//  Copyright © 2020 Mahesh Gahlot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tags: [String] = ["mars", "qwerty", "social network", "social media", "media", "Adventure", "Stories", "Games", "Pinball", "Mouse & Keyword", "m", "a", "h", "e", "s", "h", "qwerty", "social network", "social media", "media", "Adventure", "Stories", "Games", "Pinball", "Mouse & Keyword", "m", "a", "h", "e", "s", "h"]
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        var layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 10, height: 25)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
        let height = collectionView.contentSize.height
        collectionViewHeightConstraint.constant = height
        
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        cell.config(tags[indexPath.row])
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegate {
    
}

