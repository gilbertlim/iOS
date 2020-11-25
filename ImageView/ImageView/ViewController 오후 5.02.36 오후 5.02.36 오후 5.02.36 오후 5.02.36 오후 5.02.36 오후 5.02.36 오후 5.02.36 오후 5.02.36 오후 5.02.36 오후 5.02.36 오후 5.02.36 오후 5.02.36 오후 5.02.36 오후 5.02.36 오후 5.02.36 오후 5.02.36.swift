//
//  ViewController.swift
//  ImageView
//
//  Created by seongjinlim on 2020/06/05.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    //CSS에서 변경하는 것들은 Outlet으로 선언
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    //내가 만든 뷰를 불러왔을 때 호출되는 함수(뷰가 불려진 후 실행하고자 하는 기능 코딩)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        //CGFloat = Float
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
           
        if (isZoom) {
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
           
            btnResize.setTitle("확대", for: .normal)
        }
        else {
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
           
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }

    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
                   imgView.image = imgOn
               } else {
                   imgView.image = imgOff
               }
    }
    
    
}

