//
//  ViewController.swift
//  AutoLayout
//
//  Created by seongjinlim on 2020/07/06.
//  Copyright © 2020 seongjinlim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "01.png")
    }


}

