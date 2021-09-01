//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    var answer: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated:true)
        answersSelectedByUser()
    }
    
    private func answersSelectedByUser() {
        let answer = Dictionary(grouping: answer, by: {$0.animal}) .sorted(by: {$0.value.count > $1.value.count}) .first?.key
        
        UpdateUI(animal: answer)
    }
    
    private func UpdateUI(animal: Animal?) {
        resultAnimalLabel.text = "Вы \(animal?.rawValue ?? "🐶")"
        discriptionLabel.text = animal?.definition
    }
}
