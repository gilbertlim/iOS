//
//  ViewController.swift
//  PageControl
//
//  Created by Ho-Jeong Song on 22/09/2019.
//  Copyright © 2019 Ho-Jeong Song. All rights reserved.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        lblPageNumber.text = String(pageControl.currentPage+1)
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNumber.text = String(pageControl.currentPage+1)
    }
    
}

