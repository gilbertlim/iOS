//
//  EditViewController.swift
//  Navigation
//
//  Created by seongjinlim on 2020/06/28.
//  Copyright © 2020 seongjinlim. All rights reserved.
//

import UIKit

//Protocol 형태의 Delegate 추가
//Protocol : 특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도
protocol EditDelegate {
    //이 EditDelegate 프로토콜을 상속 받은 Class는 반드시 아래 메서드들을 만들어야 함.
    
    //EditViewController, OO을 인자로하는 함수
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    var isZoom = false
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    @IBOutlet var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swIsOn.isOn = isOn
        if isZoom {
            btnZoom.setTitle("확대", for: UIControl.State())
        } else {
            btnZoom.setTitle("축소", for: UIControl.State())
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        //수정화면의 값들을 메인화면으로 전달
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageZoomDone(self, isZoom: isZoom)
        }
        
        //메인화면으로 화면 전환(이동)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        }else {
            isOn = false
        }
    }
    
    @IBAction func btnImageSize(_ sender: UIButton) {
        if isZoom {
            isZoom = false
            btnZoom.setTitle("축소", for: UIControl.State())
        } else {
            isZoom = true
            btnZoom.setTitle("확대", for: UIControl.State())
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
