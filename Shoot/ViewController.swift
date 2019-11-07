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
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedVal = (slider.value*100).rounded()
        currentValue = Int(roundedVal)
    }

    @IBAction func showAlert() {
        let sliderMessage = "The slider's value is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World!", message: sliderMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedVal = (slider.value*100).rounded()
        print("The slider's value is: \(slider.value)")
        currentValue = Int(roundedVal)
    }
}

