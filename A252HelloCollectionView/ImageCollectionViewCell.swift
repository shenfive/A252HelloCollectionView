//
//  ImageCollectionViewCell.swift
//  A252HelloCollectionView
//
//  Created by DannyShen on 2025/3/9.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var shareCall:(()->())? = nil
    
    @IBOutlet weak var theImageView: UIImageView!
    @IBOutlet weak var shareAction: UIButton!
    @IBAction func sheareActionf(_ sender: Any) {
        print("Share")
        shareCall?()

    }
}
