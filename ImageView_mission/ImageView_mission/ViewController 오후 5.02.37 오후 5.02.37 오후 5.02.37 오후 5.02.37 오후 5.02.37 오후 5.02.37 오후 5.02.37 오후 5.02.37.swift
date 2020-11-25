//
//  ViewController.swift
//  ImageViewer_mission
//
//  Created by seongjinlim on 2020/06/07.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    var maxImage = 6
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageSelect()
    }

    func imageSelect() {
        let imageName = String(numImage) + ".png"
        imageView.image = UIImage(named: imageName)
    }
    
    @IBAction func beforeBtn(_ sender: UIButton) {
        numImage -= 1
        if (numImage < 1) {
            numImage = maxImage
        }
        imageSelect()
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        numImage += 1
        if (numImage > maxImage) {
            numImage = 1
        }
        imageSelect()
    }
}

