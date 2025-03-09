//
//  ViewController.swift
//  A252HelloCollectionView
//
//  Created by DannyShen on 2025/3/9.
//

import UIKit

class ViewController: UIViewController {
    
    var images:[UIImage?] = []

    @IBOutlet weak var theCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [
            UIImage(named: "p1"),
            UIImage(named: "p2"),
            UIImage(named: "p3"),
            UIImage(named: "p4"),
            UIImage(named: "p5"),
            UIImage(named: "p6")
        ]
        
        
        setLayout(numberInLine: 3)
      

        theCollectionView.delegate = self
        theCollectionView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
    }
    
    
    
    @IBAction func changeNumberInLine(_ sender: UISegmentedControl) {
        var numberInLine = CGFloat( sender.selectedSegmentIndex + 3)
        setLayout(numberInLine: numberInLine)
    }
    
    func setLayout(numberInLine:CGFloat){
        let screen = UIScreen.main.bounds
        let layout = UICollectionViewFlowLayout()
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: screen.width / numberInLine - 10,
                                 height: screen.width / numberInLine + 70)
        theCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell",
                                                      for: indexPath)
        as! ImageCollectionViewCell
        cell.theImageView.image = images[indexPath.row]
        cell.shareCall = {
            let alert = UIAlertController(title: nil, message: "請選擇", preferredStyle: .alert)
            let action = UIAlertAction(title: "確定", style: .default) { _ in
                print("shared")
            }
            alert.addAction(action)
            let action2 = UIAlertAction(title: "取消", style: .cancel)
            alert.addAction(action2)
            self.present(alert, animated: true)
        }
        return cell
    }
    
    
}
