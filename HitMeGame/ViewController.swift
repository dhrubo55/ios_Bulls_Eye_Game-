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
    var targetValue: Int = 0
    var score = 0
    var roundNumber = 1

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var guessingNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
       startNewGame()
        
        let thumbsImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbsImageNormal, for: .normal)
    
        
        let thumbsImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbsImageHighlighted, for: .highlighted)
        
        let insests = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftImageResizeable = trackLeftImage?.resizableImage(withCapInsets: insests)
        slider.setMinimumTrackImage(trackLeftImageResizeable, for: .normal)
        
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightImageResizeable = trackRightImage?.resizableImage(withCapInsets: insests)
        slider.setMaximumTrackImage(trackRightImageResizeable, for: .normal)
        
    }


    @IBAction func showMe(){
        
        let differnece = Swift.abs(currentValue-targetValue)
        var point = 100-differnece
        
        
        if point==100{
            point += 100
        }else if point == 99 {
            point += 50
        }
        score += point
        
        roundNumber += 1
        
        let title: String
        
        if differnece == 0 {
            title = "Perfect Score"
        }else if differnece < 5{
            title = "You Almost Had It"
        }else if differnece < 10 {
            title = "Pretty Close"
        }else{
            title = "Not Even Close..."
        }
        
        let message = "You have scored \(point) points"
        
       let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        startNewRound()
    }
    
    
    @IBAction func startNewGame(){
        roundNumber = 0
        score = 0
        startNewRound()
    
    }
    
    @IBAction func sliderMove(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50;
        slider.value = Float(currentValue)
        
        
        updateLabel()
    }
    
    func updateLabel(){
        guessingNumberLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundNumber)
        
    }
}

