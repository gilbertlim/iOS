//
//  ViewController.swift
//  Test
//
//  Created by seongjinlim on 2020/07/11.
//  Copyright © 2020 seongjinlim. All rights reserved.
//

import UIKit

class Helo {
    var name = "Taro"
    func say() {
        print("Hello, " + name + "!")
    }
}
class Friend {
    var name:String = "Gilbert"
    var old:Int = 0
    var age:Int {
        get {
            return old
        }
        set {
            if newValue > 0 {
                old = newValue
            }
        }
        
    }
    
//    init(name:String, age:Int) {
//        self.name = name
//        self.old = age
//    }
    
    func printData() {
        print("\(self.name) (\(age))")
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var lbl: UILabel!
    var obj:Helo = Helo()
    var you:Friend = Friend()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lbl.text = "test"
        
        obj.say()
        obj.name = "Hanako"
        obj.say()
        you.age = 5
        you.printData()
        
//        let nickname: String? = nil
//        let fullName: String = "John Appleseed"
//        let informalGreeting = "Hi \(nickname ?? fullName)"
//        if nickname == nil {
//            print(fullName, terminator: "")
//            print(1)
//        }
//        let justOverOneMillion = 1_000_000000_000_1
//        print(justOverOneMillion)
//
//        typealias abc = UInt16
//        print(abc.min)
        
//        let http404Error = (code: 404, description: "Not Found")
//        let (statusCode, _) = http404Error
//        print("The status code is \(statusCode)")
//        print("The status code is \(http404Error.0)")
//        print("The status code is \(http404Error.code)")
        
//       let possibleNumber = "123"
//
//       if let actualNumber = Int(possibleNumber) {
//            print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
//        } else {
//            print("The string \"\(possibleNumber)\" could not be converted to an integer")
//        }
        let assumedString: String! = "An implicitly unwrapped optional string."
        let implicitString: String = assumedString
        if assumedString != nil {
            print(assumedString!)
        }
        if let def = assumedString {
            print(def)
        }
        
//        func makeASandwich() throws {
//            
//        }
//        do {
//            try makeASandwich()
//            eatASandwich()
//        } catch SandwichError.outOfCleanDishes {
//            washDishes()
//        } catch SandwichError.missingIngredients(let ingredients) {
//            buyGroceries(ingredients)
//        }
        
    }
    
    
 
    
    


}

