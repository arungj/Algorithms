//
//  ViewController.swift
//  Algorithms
//
//  Created by Arun George on 1/28/18.
//  Copyright © 2018 GJ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    enum TableOptions: String {
        case palindrome = "Palindrome"
        case pangram = "Pangram"
        case sumInArray = "Sum in array of numbers"
    }
    
    let dataSource: [TableOptions] = [.palindrome, .pangram, .sumInArray]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = dataSource[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultViewController = ResultViewController(nibName: "ResultViewController", bundle: nil)
        resultViewController.title = dataSource[indexPath.row].rawValue
        resultViewController.mode = dataSource[indexPath.row]
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}
