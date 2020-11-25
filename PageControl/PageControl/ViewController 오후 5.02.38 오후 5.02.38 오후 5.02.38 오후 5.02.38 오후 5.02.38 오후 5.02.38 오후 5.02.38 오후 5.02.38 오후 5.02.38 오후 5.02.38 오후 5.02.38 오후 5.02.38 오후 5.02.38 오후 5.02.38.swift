//
//  ViewController.swift
//  PageControl
//
//  Created by Ho-Jeong Song on 22/09/2019.
//  Copyright © 2019 Ho-Jeong Song. All rights reserved.
//

import UIKit

var images = [ "01.png", "02.png", "03.png", "04.png", "05.png", "06.png" ]

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //이미지 개수 만큼 페이지 개수 설정
        pageControl.numberOfPages = images.count
        //처음 페이지 번호 설정
        pageControl.currentPage = 0
        
        //전체 인디케이터 색 설정
        pageControl.pageIndicatorTintColor = UIColor.green
        //현재 페이지 인디케이터 색 설정
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        
        imgView.image = UIImage(named: images[0])
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
}

