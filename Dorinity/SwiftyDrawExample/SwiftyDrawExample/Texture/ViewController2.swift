//
//  ViewController.swift
//  Texture
//
//  Created by burt on 2016. 2. 29..
//  Copyright © 2016년 BurtK. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageView : UIImageView!
       // imageView = ViewController.imageView
 
    }
    
    func takeScreenshot(view: UIView) -> UIImageView {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        return UIImageView(image: image)
    }
    
}

