//
//  ViewController.swift
//  UpDownGame
//
//  Created by seongjinlim on 2020/05/31.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI의 값을 활용하거나 코드해서 활용하고자 할 때 아울렛 선언
    var randomValue: Int = 0
    var tryCount: Int = 0
    var i:Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    
    //이벤트 발생 시 액션 코드 선언
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        //sliderValueLabel.text = String(integer_t(sender.value))
        
    }
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        
        i += 1
        tryCountLabel.text = String(i) + " / 5"
    }
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
        print("reset!")
        print(randomValue)
    }
}

