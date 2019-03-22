//
//  ViewController.swift
//  BullsEye
//
//  Created by Александр Филиппов on 21.03.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score += points
        round += 1
        
        let message = "Your score is \(points) points"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,    // changed
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",          // changed
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}



