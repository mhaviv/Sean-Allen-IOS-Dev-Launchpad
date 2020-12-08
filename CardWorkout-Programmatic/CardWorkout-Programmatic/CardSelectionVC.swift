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
    let workoutLabel    = UILabel()
    
    var cards: [String?] = Card.getAllCards()
    var selectedCard: String?
    
    var timer: Timer! // One of the exceptions to force unwrap. Its self contained within viewDidLoad and isnt relying on a network call or view controller to pass us that data

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    // Invalidate timer on viewWillDisappear when navigating to another view so timer stops
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }
    
    func startTimer() {
        // set a timer to fire repeatedly every set time interval
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        selectedCard = cards.randomElement() ?? "AS"
        cardImageView.image = UIImage(named: selectedCard ?? "AS")
    }
    
    @objc func stopButtonTapped() {
        print("Stop selected \(selectedCard)")
        timer.invalidate() // stops timer
        titleCreator()
    }
    @objc func restartButtonTapped() {
        selectedCard = ""
        titleCreator()
        timer.invalidate()
        startTimer()
    }
}

extension CardSelectionVC {
        
    func cardWorkoutType() -> String {
        var workout = ""
        let name = selectedCard ?? ""
            if name.contains("C") {
                workout = "Burpees"
                print("Do \(workout)")
            } else if name.contains("H") {
                workout = "Sit-ups"
                print("Do \(workout)")
            } else if name.contains("S") {
                workout = "Push-ups"
                print("Do \(workout)")
            } else if name.contains("D") {
                workout = "Jumping Jacks"
                print("Do \(workout)")
            }
        return workout
    }
    
    func cardValueRepIdentifier() -> Int {
        var repCount = 0
        let name = selectedCard ?? ""
            if name.contains("J") {
                repCount = 11
                print("This is \(repCount) reps")
            } else if name.contains("Q") {
                repCount = 12
                print("This is \(repCount) reps")
            } else if name.contains("K") {
                repCount = 13
                print("This is \(repCount) reps")
            } else if name.contains("A") {
                repCount = 14
                print("This is \(repCount) reps")
            } else {
                repCount = numberValueFromImageName(imageName: name)
                print(repCount)
            }
        return repCount
    }
    
    func titleCreator() {
        let workoutType = cardWorkoutType()
        let reps = cardValueRepIdentifier()
        let label = workoutLabel
        var title: String?
        
        if selectedCard == "" {
            title = "Press the Stop button to reveal your workout!"
            label.text = title
        } else {
            title = "Do \(reps) \(workoutType)"
            label.text = title
        }
    }
    
    func numberValueFromImageName(imageName: String) -> Int {
        var numberValue: Int = 0
        do {
            let regex = try NSRegularExpression(pattern: "[\\d.]+", options: [])
            let numbers = regex.matches(in: imageName, options: [], range: NSRange(location: 0, length: imageName.count))
                .map { (imageName as NSString).substring(with: $0.range) }
                .compactMap { Int($0) }
            for number in numbers {
                if numbers.count < 2 {
                    numberValue = number
                    print("This is \(numberValue)")
                } else {
                    numberValue = 10
                    print("This is \(numberValue)")
                }
            }
        } catch {
            print("No number value in image name")
        }
        return numberValue
    }
}

extension CardSelectionVC {
    
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
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
        
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

