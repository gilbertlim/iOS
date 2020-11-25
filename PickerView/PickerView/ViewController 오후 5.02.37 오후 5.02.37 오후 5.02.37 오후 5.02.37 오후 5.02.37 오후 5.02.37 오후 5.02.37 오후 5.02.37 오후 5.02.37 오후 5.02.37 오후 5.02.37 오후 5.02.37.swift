//
//  ViewController.swift
//  PickerView
//
//  Created by seongjinlim on 2020/06/14.
//  Copyright © 2020 Gilbert Lim. All rights reserved.
//

import UIKit
//    델리게이트 객체란 다른 객체의 변화에 대응하거나, 다른 객체의 행동에 변화를 줄 수 있는 개체를 일컫는다. 델리게이트 패턴의 기본적인 원칙은, 두 객체가 힘을 합쳐서 문제를 해결한다는 것입니다. 첫번째 객체는 매우 범용적으로 여러 가지 상황에 재사용할 수 있는 성격을 지니며, 두 번째 객체에 대한 레퍼런스를 저장해 놓고 중요할 때마다 메시지를 전송하는 역할을 합니다.

//UI~~ 3가지 프로토콜을 채택하기
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ]
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }

    //Pickerview에 표시되는 열의 개수(1개) 넘겨주는 델리게이트 메서드
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //행의 개수(데이터의 개수)를 넘겨주는 델리게이트 메서드
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    //각 열의 타이틀을 문자열으로 넘겨줌(파일명)
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    //각 열의 뷰를 UIView 타입의 값으로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    //룰렛이 선택되었을 때 레이블 텍스트값 변경
    //원하는 행을 선택했을 때 할 일을 델리게이트에게 지시하는 메서드
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
}

