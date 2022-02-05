//
//  ViewController.swift
//  trafficLights
//
//  Created by Максим Хабиров on 01.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redColorView: UIView!
    @IBOutlet weak var yellowColorView: UIView!
    @IBOutlet weak var greenColorView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLightColor = CurrentLightColor.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redColorView.alpha = lightIsOff
        yellowColorView.alpha = lightIsOff
        greenColorView.alpha = lightIsOff
        
        startButton.setTitle("START", for: .normal)
    }

    @IBAction func startButtonPress() {
        
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLightColor {
        case .red:
            greenColorView.alpha = lightIsOff
            redColorView.alpha = lightIsOn
            currentLightColor = .yellow
        case .yellow:
            redColorView.alpha = lightIsOff
            yellowColorView.alpha = lightIsOn
            currentLightColor = .green
        case .green:
            yellowColorView.alpha = lightIsOff
            greenColorView.alpha = lightIsOn
            currentLightColor = .red
        }
    }
}

extension ViewController {
    enum CurrentLightColor {
        case red, yellow, green
    }
}
