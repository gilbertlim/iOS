//
//  ViewController.swift
//  Calculator
//
//  Created by Gilbert on 2020/08/11.
//  Copyright © 2020 Gilbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    //메서드 선언
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        //Button에 값이 설정되면 어떻게 가져올까? -> 끝에 !
        //강제적으로 연결값을 가져오는 방법
        
        print("touched \(digit) digit")
    }
    

}

