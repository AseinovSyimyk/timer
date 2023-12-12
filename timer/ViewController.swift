//
//  ViewController.swift
//  timer
//
//  Created by User on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    var timer: Timer?
    var seconds = 0
    var isTimerRunning = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimerLabel()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        if isTimerRunning {
            seconds += 1
            updateTimerLabel()
        }
    }
    
    func updateTimerLabel() {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        timerLabel.text = String(format: "%02d:%02d", minutes, remainingSeconds)
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        isTimerRunning = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        isTimerRunning = true
        pauseButton.isEnabled = true
        playButton.isEnabled = false
    }
}

