//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Michael Haviv on 11/30/20.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var titleLabel: UILabel!
    
    var cards: [String?] = Card.getAllCards()
    var selectedCard: String?
    
    var timer: Timer! // One of the exceptions to force unwrap. Its self contained within viewDidLoad and isnt relying on a network call or view controller to pass us that data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
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
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop selected \(selectedCard)")
        timer.invalidate() // stops timer
        titleCreator()
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
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
        let label = titleLabel
        var title: String?
        
        if selectedCard == "" {
            title = "Press the Stop button to reveal your workout!"
            label?.text = title
        } else {
            title = "Do \(reps) \(workoutType)"
            label?.text = title
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
