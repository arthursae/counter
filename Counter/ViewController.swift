//
//  ViewController.swift
//  Counter
//
//  Created by Artur Abdurakhmanov on 17/09/2025.
//

import UIKit

class ViewController: UIViewController {
    let dateFormatter = DateFormatter()
    private var counter = 0
    @IBOutlet weak var historyText: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func plusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        let dateTimeMessage = "[\(dateFormatter.string(from: Date()))]"
        let userMessage = " значение изменено на +1"
        historyText.text += "\r\n" + dateTimeMessage + userMessage
    }
    
    @IBAction func minusButton(_ sender: Any) {
        counter -= 1
        let dateTimeMessage = "[\(dateFormatter.string(from: Date()))]"
        if counter >= 0 {
            counterLabel.text = "\(counter)"
            let userMessage = " значение изменено на -1"
            historyText.text += "\r\n" + dateTimeMessage + userMessage
        } else if counter < 0 {
            counter = 0
            let userMessage = " попытка уменьшить значение счётчика ниже 0"
            historyText.text += "\r\n" + dateTimeMessage + userMessage
            counterLabel.text = "0"
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = "0"
        let dateTimeMessage = "[\(dateFormatter.string(from: Date()))]"
        let userMessage = " значение сброшено"
        historyText.text += "\r\n" + dateTimeMessage + userMessage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
    }
}
