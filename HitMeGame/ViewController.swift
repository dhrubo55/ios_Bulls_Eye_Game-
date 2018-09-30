//
//  ViewController.swift
//  HitMeGame
//
//  Created by Dhrubo Hasan on 9/30/18.
//  Copyright © 2018 Dhrubo Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func showMe(){
        let message = "The value of the slider is now \(currentValue)"
        
       let alert = UIAlertController(title: "Hello world", message: message, preferredStyle:.alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
    }
    
    
    @IBAction func sliderMove(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
}

