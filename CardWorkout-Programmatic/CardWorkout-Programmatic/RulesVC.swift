//
//  RulesVCViewController.swift
//  CardWorkout-Programmatic
//
//  Created by Michael Haviv on 12/4/20.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLabel = RulesLabel(
        text: "Rules",
        fontSize: 40,
        fontWeight: .bold,
        textAlignedCenter: true,
        wordWrapping: false
    )
    let rulesLabel = RulesLabel(
        text: """
        The value of each card represents the number of exercise you do.

        J = 11, Q = 12, K = 13, A = 14
        """,
        fontSize: 19,
        fontWeight: .semibold,
        textAlignedCenter: true,
        wordWrapping: true
    )
    let exerciseLabel = RulesLabel(
        text: """
        ♠️ = Push-ups

        ♥️ = Sit-ups

        ♣️ = Burpees

        ♦️ = Jumping Jacks

        """,
        fontSize: 19,
        fontWeight: .semibold,
        textAlignedCenter: false,
        wordWrapping: false
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureTitleLabel()
        configureRulesLabel()
        configureExerciseLabel()
    }
    
    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func configureRulesLabel() {
        view.addSubview(rulesLabel)
        
        NSLayoutConstraint.activate([
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func configureExerciseLabel() {
        view.addSubview(exerciseLabel)
        
        NSLayoutConstraint.activate([
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
