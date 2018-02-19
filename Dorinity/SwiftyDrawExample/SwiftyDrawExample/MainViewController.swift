//
//  MainViewController.swift
//  SwiftyDrawExample
//
//  Created by Jisoo Kim on 2018. 2. 6..
//  Copyright © 2018년 Walzy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["saveCube3D1", "saveCube3D2", "saveCube3D3"]
    var selectedIdx : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.myImage.image = UIImage(named : images[indexPath.row])
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 3
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //화면 이미지 재설정 여기서 처리, saveCube3D.png에 이전까지 그린 큐브가 저장되어있음.
        //만약 저장되어있지않다면 기본 3d를 출력.
        if let select = selectedIdx {
            let indexPath = IndexPath(item: select, section : 0)
            let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
            
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let url = URL(fileURLWithPath: path).appendingPathComponent("saveCube3D.png")
            if let img = UIImage(contentsOfFile: url.path) {
                print(url.path + " in main ")
                cell.myImage.image = img
            }
            
        }
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("prepare")
        
        if segue.identifier == "DrawSegue" {
            if let destination = segue.destination as? ViewController{
                if let items = collectionView.indexPathsForSelectedItems {
                    destination.selectedIdx = items[0].row
                    selectedIdx = destination.selectedIdx
                    dataCenter.selectedIdx = destination.selectedIdx
                }
                else{
                    print("dismiss")
                    destination.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
}

