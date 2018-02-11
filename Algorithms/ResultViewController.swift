//
//  ResultViewController.swift
//  Algorithms
//
//  Created by Arun George on 1/28/18.
//  Copyright © 2018 GJ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    typealias SimpleBlock = () -> Void
    var mode: TableViewController.TableOptions!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var containerStack: UIStackView!
    var action: SimpleBlock?
    lazy var algorithmsModel = AlgorithmsModel()
    
    // MARK: - Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChanged(_:)), name: .UIKeyboardDidChangeFrame, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let scrollView = view.subviews[0] as? UIScrollView {
            scrollView.flashScrollIndicators()
        }
    }
    
    func configureUI() {
        switch mode! {
        case .palindrome:
            palindrome()
        case .pangram:
            pangram()
        case .sumInArray:
            sumInArray()
        }
    }
    
    @IBAction func tapAction(_ sender: Any) {
        action?()
    }
    
    // MARK: - Methods
    func palindrome() {
        let textField = addSectionWith(title: "Enter a string", auxiliaryText: "eg: noon, civic, radar")
        action = {
            guard let text = textField.text, text.count > 0 else {
                self.showError(); return
            }
            self.outputLabel.text = self.algorithmsModel.palindrome(text: text) ? "Text is a palindrome" : "Text is not a palindrome"
        }
    }
    
    func pangram() {
        let textField = addSectionWith(title: "Enter a sentence", auxiliaryText: "")
        action = {
            guard let text = textField.text, text.count > 0 else {
                self.showError(); return
            }
            let missingLetters = self.algorithmsModel.pangram(text: text)
            self.outputLabel.text = missingLetters.count == 0 ? "Text is a pangram" : "Text is not a pangram. \n Missing letters: " + missingLetters
        }
    }
    
    func sumInArray() {
        let sumTextField = addSectionWith(title: "Enter the required sum", auxiliaryText: "")
        let arrayTextField = addSectionWith(title: "Enter the array of numbers separated by comma", auxiliaryText: "1,2,3,4,5")
        
        action = {
            // Read the array and the sum number.
            guard let sumText = sumTextField.text, let sum = Int(sumText),
                let arrayText = arrayTextField.text else {
                    self.showError(); return
            }
            
            let splitArray = arrayText.components(separatedBy: CharacterSet(charactersIn: ","))
            self.outputLabel.text = "Entered array: \(splitArray)" + "\n Sum: \(sum)"
            // Convert string array to int array.
            let intArray = splitArray.flatMap{Int($0)}

            // Calculate and show the output.
            if let result = self.algorithmsModel.find(sum: sum, in: intArray) {
                self.outputLabel.text = self.outputLabel.text! + "\n The numbers are: \(result.0) and \(result.1)"
            } else {
                self.outputLabel.text = self.outputLabel.text! + "\nError, numbers not found."
            }
        }
    }
    
    // MARK: - UI
    func addSectionWith(title: String, auxiliaryText: String) -> UITextField {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = title
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = auxiliaryText
        
        containerStack.insertArrangedSubview(textField, at: 1)
        containerStack.insertArrangedSubview(label, at: 1)
        return textField
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "Invalid input", preferredStyle: .alert)
        let button = UIAlertAction(title: "Dismiss", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
}

extension UIViewController {
    @objc func keyboardChanged(_ notification: Notification) {
        
    }
}
