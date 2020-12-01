import UIKit

func numberValueFromImageName(name: String) -> Int {
    var numberValue: Int = 0
    do {
        let regex = try NSRegularExpression(pattern: "[\\d.]+", options: [])
        let numbers = regex.matches(in: name, options: [], range: NSRange(location: 0, length: name.count))
            .map { (name as NSString).substring(with: $0.range) }
            .compactMap { Int($0) }
        for number in numbers {
            if numbers.count < 2 {
                numberValue = number
            } else {
                numberValue == 10
            }
        }
    } catch {
        print("No number value in image name")
        return 0
    }
    return numberValue
}

numberValueFromImageName(name: "8H")

