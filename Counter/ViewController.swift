//
//  ViewController.swift
//  Counter
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var historyText: UITextView!
    @IBOutlet private weak var counterLabel: UILabel!

    // MARK: - Properties

    private var counter = 0

    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction private func plusButton(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        appendToHistory("значение изменено на +1")
    }

    @IBAction private func minusButton(_ sender: Any) {
        counter -= 1
        if counter >= 0 {
            counterLabel.text = "\(counter)"
            appendToHistory("значение изменено на -1")
        } else {
            counter = 0
            counterLabel.text = "0"
            appendToHistory("попытка уменьшить значение счётчика ниже 0")
        }
    }

    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        counterLabel.text = "0"
        appendToHistory("значение сброшено")
    }

    // MARK: - Private Methods

    private func appendToHistory(_ message: String) {
        let timestamp = "[\(dateFormatter.string(from: Date()))]"
        historyText.text += "\n\(timestamp) \(message)"
    }
}
