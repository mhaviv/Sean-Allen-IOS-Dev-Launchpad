//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Michael Haviv on 12/2/20.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let restartButton   = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")
    let workoutLabel      = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureCardImageView()
        configureTitleLabel()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView) // adding card image view to view controller
        cardImageView.translatesAutoresizingMaskIntoConstraints = false // use autolayout on this object
        cardImageView.image = UIImage(named: "AS")
        
        // takes in an array of constraints
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250), // equal to constant when its a set number
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -65)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
//        stopButton.translatesAutoresizingMaskIntoConstraints = false --> dont need to add since parent class CWButton has this
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
//        restartButton.translatesAutoresizingMaskIntoConstraints = false --> dont need to add since parent class CWButton has this
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
//        rulesButton.translatesAutoresizingMaskIntoConstraints = false --> dont need to add since parent class CWButton has this
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC() {
        // Segue is only for storyboards
        present(RulesVC(), animated: true) // animated means the screen that slides up
    }
    
    func configureTitleLabel() {
        view.addSubview(workoutLabel)
        workoutLabel.translatesAutoresizingMaskIntoConstraints = false
        workoutLabel.font = .systemFont(ofSize: 25, weight: .bold)
        workoutLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            workoutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            workoutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            workoutLabel.bottomAnchor.constraint(equalTo: cardImageView.topAnchor, constant: -20),
            workoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        workoutLabel.lineBreakMode = .byWordWrapping
        workoutLabel.numberOfLines = 0
        workoutLabel.text = "Press the Stop button to reveal your workout!"

    }
}
