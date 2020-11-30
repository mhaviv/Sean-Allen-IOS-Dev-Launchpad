//
//  ColorsTableVC.swift
//  RandomColors
//
//  Created by Michael Haviv on 11/19/20.
//

import UIKit

// For table views, always remember to connect delegate and data source (otherwise table view wont work
class ColorsTableVC: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var colors: [UIColor] = []
    
    enum Cells {
        static let colorCell = "colorCell"
    }
    
    enum Segues {
        static let toDetailColorsVC = "ToColorsDetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            if colors.count != 50 {
                colors.append(.random())
            } else {
                colors.removeAll()
                colors.append(.random())
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC // casting destination view controller as a ColorsDetailVC
        destVC.color = sender as? UIColor // When you specify a sender in a function and then the catching function has it set to Any type, you must specify the type yourself
    }
    
    @IBAction func refreshTableView(_ sender: Any) {
        addRandomColors()
        self.tableView.reloadData()
        print("Table View Data Reload")
    }
}

// if confirming to a delegate, Sean likes to make an extension for code organization
extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colors.count
    }
    
    // Table view delegate (delegate is equivalent of a callback where the function is delegate to when another file/function fires)
    // Everytime a cell appears on the screen this function gets called
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Unwrap optional tableview cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else
        { return UITableViewCell() }
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetailColorsVC, sender: color) // dont forget to update sender when its dynamic
    }


}
