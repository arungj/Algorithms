//
//  ResultViewController.swift
//  Algorithms
//
//  Created by Arun George on 1/28/18.
//  Copyright © 2018 GJ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var mode: TableViewController.TableOptions!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var containerStack: UIStackView!
    var action: (() -> Void)?
    lazy var algorithmsModel = AlgorithmsModel()
    
    // MARK: - Configuration
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        switch mode! {
        case .palindrome:
            palindrome()
        case .pangram:
            pangram()
        }
    }
    
    @IBAction func tapAction(_ sender: Any) {
        action?()
    }
    
    // MARK: - Methods
    func palindrome() {
        let textField = addSectionWith(title: "Enter a string", auxiliaryText: "eg: noon, civic, radar")
        action = {
            guard let text = textField.text,
                text.count > 0 else {
                    self.showError()
                    return
            }
            self.outputLabel.text = self.algorithmsModel.palindrome(text: text) ? "Text is a palindrome" : "Text is not a palindrome"
        }
    }
    
    func pangram() {
        let textField = addSectionWith(title: "Enter a sentence", auxiliaryText: "")
        action = {
            guard let text = textField.text,
                text.count > 0 else {
                    self.showError()
                    return
            }
            let missingLetters = self.algorithmsModel.pangram(text: text)
            self.outputLabel.text = missingLetters.count == 0 ? "Text is a pangram" : "Text is not a pangram. \n Missing letters: " + missingLetters
        }
    }
    
    // MARK: - UI
    func addSectionWith(title: String, auxiliaryText: String) -> UITextField {
        let label = UILabel()
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
