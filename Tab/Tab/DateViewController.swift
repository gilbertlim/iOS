//
//  ViewController.swift
//  DatePicker_mission
//
//  Created by seongjinlim on 2020/06/09.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    let interval =  1.0
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    var alarmTime: String? //전체에서 선언 필요
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func datePicker(_ sender: UIDatePicker) {
        let pickerTime = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm aaa"
        
        lblPickerTime.text = "선택시간 : " + formatter.string(from: pickerTime.date)
        
        alarmTime = formatter.string(from: pickerTime.date)
    }
    
    @objc func updateTime() {
        let date = NSDate() //현재시간 함수
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm aaa"
        
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        let currentTime = formatter.string(from: date as Date)
        
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
    }
}

