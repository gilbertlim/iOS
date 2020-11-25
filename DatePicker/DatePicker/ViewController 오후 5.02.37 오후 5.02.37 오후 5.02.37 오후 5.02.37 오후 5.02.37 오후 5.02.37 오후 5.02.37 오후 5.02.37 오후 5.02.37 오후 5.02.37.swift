//
//  ViewController.swift
//  Datepicker
//
//  Created by seongjinlim on 2020/06/08.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //타이머가 구동되면 실행할 함수 지정
    let timeSelector: Selector = #selector(ViewController.updateTime)
    /*  # 셀렉터(Selector) - 함수를 직접 지정하는 기능을 가진 일종의 함수 선택자
        Selector는 본래 Objecive-C에서 클래스 메소드의 이름을 가르키는 데
        사용되는 참조 타입입니다.

        동적 호출 등의 목적으로 @selector() 어트리뷰트 메소드 이름을 인자값으로 넣어
        전달하면 이를 내부적으로 정수값으로 매핑해서 처리하는 형태입니다.
        이것이 Swift로 넘어오면서 구조체 형식으로 정의되고, #selector()구문을
        사용하여 해당 타입의 값을 생성할 수 있게 되었습니다.

        Swift4부터는 Selector 타입으로 전달할 메소드를 작성할 때
        반드시 @objc 어트리뷰트를 붙여주어야 합니다.
        이는 Objective-C와의 호환성을 위한 것으로, Swift에서 정의한 메소드를
        Objective-C에서도 인식할 수 있게 해 줍니다.*/


    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //target: 동작될 view, selector: 타이머가 구동될 때 실행할 함수
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        /*DateFormatter : 클래스 상수
          DateFormatter() {
            dateFormat: ...
            string: ...
        }*/
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm EEE"
        
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    //#selector()의 인자로 사용될 메서드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞에 @objc 반드시 키워드를 붙임
    @objc func updateTime() {
  
        /*lblCurrentTime.text = String(count)
         count = count + 1*/
        
        //현재시간 가져오기
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        //인스턴스 타입 확인 : is
        //인스턴스 형변환 : as --> date를 Data 형식으로 변경
        
    }
}

