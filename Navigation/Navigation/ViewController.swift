//
//  ViewController.swift
//  Navigation
//
//  Created by seongjinlim on 2020/06/28.
//  Copyright © 2020 seongjinlim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate { //델리게이트 채택
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    var orgZoom = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    //세그웨이를 이용하여 화면을 전환하기 위해 prepare 함수사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이의 목적지 Controller 선언
        let editViewController = segue.destination as! EditViewController
        
        //세그웨이 ID에 따라 다르게 동작하도록 세팅
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue : use bar button"
        }
        //메인화면 화면 값들을 수정화면으로 전달
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = orgZoom
        //델리게이트 위임자 정하기, EditViewController의 일을 ViewController가 대신한다.
        editViewController.delegate = self
        
    }
    
    //ViewController는 EditDelegate 프로토콜을 상속 받았기 떄문에 아래 3개 메서드는 반드시 있어야 함.
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        //수정화면에서 메세지를 가져와 메인화면에 띄움
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn { //수정화면의 isOn이 true 이면
            imgView.image = imgOn
            self.isOn = true //메인화면 isOn에도 true 저장
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom { //수정화면의 isZoom 값이 true면
            if orgZoom { //메인화면의 orgZoom 값이 true 면
                
            } else {
                self.isZoom = false
                self.orgZoom = true
                newWidth = imgView.frame.width*scale
                newHeight = imgView.frame.height*scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            }
            
            print("Zoom: true")
        } else { //처음에 isZoom이 false이기 때문에 여기부터 시작.
            if orgZoom  { //처음에 orgZoom이 false이기 때문에 여기부터 시작.
                self.isZoom = true
                self.orgZoom = false
                newWidth = imgView.frame.width/scale
                newHeight = imgView.frame.height/scale
                imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            } else {
                
            }
            
            print("Zoom: false")
        }
    }
}

