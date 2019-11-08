//
//  ViewController.swift
//  Slider-app
//
//  Created by Subramanian on 2019-11-06.
//  Copyright © 2019 subramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 50
    var score = 0
    var totalscore = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Initial Slider Value: \(slider.value)")
        let roundedVal = (slider.value*100).rounded()
        print("roundedVal: \(roundedVal)")
        currentValue = Int(roundedVal)
        startOver()
    }

    @IBAction func showAlert() {
        score = 100 - abs(currentValue - targetValue)
        if(score == 100){
            score += 100
        }
        
        let sliderMessage = "Your score is: \(score)"
        
        let alert = UIAlertController(title: "Game Over", message: sliderMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Thanks", style: .default, handler: {
            /**
             Closures in swift
             */
            action in
            self.newRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedVal = (slider.value*100).rounded()
        print("The slider's value is: \(slider.value)")
        currentValue = Int(roundedVal)
    }
    
    func newRound() {
        round += 1
        totalscore += score
        targetValue = Int(Float.random(in: 0.01...1.00)*100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateTargetLabel()
    }
    
    func updateTargetLabel () {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(totalscore)
        roundLabel.text = String(round)
    }
    
    @IBAction func startOver() {
        print("Nice try fam")
        currentValue = 50
        targetValue = 50
        score = 0
        totalscore = 0
        round = 0
        newRound()
    }
}

