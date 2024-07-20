//
//  QuestViewController.swift
//  AsgntTendable
//
//  Created by Suprabha Dhavan on 20/07/24.
//

import Foundation
import UIKit

struct Quest {
    let quest: String
    let answers: [String]
    let correctAnswer: Int
}

class QuestViewController: UIViewController {

    @IBOutlet weak var questLabel: UILabel!

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    private let networkManager = NetworkManager()
    lazy var buttons: [UIButton] = { return [self.button1, self.button2, self.button3, self.button4] }()
   var quests:[Quest] = []
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var endLabel: UILabel!
    var questionIndexes: [Int]!
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        questionIndexes = Array(0 ..< quests.count)
        questionIndexes.shuffle()

        updateLabelsAndButtonsForIndex(questionIndex: 0)
    }
    override func viewWillAppear(_ animated: Bool) {
       getRandomQuestion()
    }
    func updateLabelsAndButtonsForIndex(questionIndex: Int) {
        guard questionIndex < quests.count else {
            endLabel.isHidden = false
            endLabel.text = "Submitted Successfully!"
            nextButton.isHidden = true
            submitFun()
            return
        }
        currentQuestionIndex = questionIndex
        hideEndLabelAndNextButton()

        let questionObject = quests[questionIndexes[questionIndex]]
        questLabel.text = questionObject.quest
        for (answerIndex, button) in buttons.enumerated() {
            button.setTitle(questionObject.answers[answerIndex], for: .normal)
        }
    }

    func hideEndLabelAndNextButton() {
        endLabel.isHidden = true
        nextButton.isHidden = true
    }

    func unhideEndLabelAndNextButton() {
        endLabel.isHidden = false
        nextButton.isHidden = false
    }


    @IBAction func didTapAnswerButton(button: UIButton) {
        unhideEndLabelAndNextButton()

        let buttonIndex = buttons.firstIndex(of:button)
        let questionObject = quests[questionIndexes[currentQuestionIndex]]

        if buttonIndex == questionObject.correctAnswer {
            endLabel.text = "True"
        } else {
            endLabel.text = "False"
        }
    }

    @IBAction func didTapNextButton(sender: AnyObject) {
        updateLabelsAndButtonsForIndex(questionIndex: currentQuestionIndex + 1)
    }
    func getRandomQuestion()  {
        networkManager.getRadomQuestions { result in
            switch result {
            case .success(let questions):
                /// if the data is retrieved
                DispatchQueue.main.async { [self] in
                    self.quests = quests
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
    }
    
    func submitFun() {
        let url = "http://localhost:5001/api/inspections/submit"
        networkManager.getSubmit(idStr: "", nameStr: "", urlStr: url)
    }
    func saveStateChanges() {
       
        UserDefaults.standard.setValue("q1", forKey: "quest1")
        UserDefaults.standard.setValue("q2", forKey: "quest2")
        UserDefaults.standard.setValue("q3", forKey: "quest3")
        UserDefaults.standard.setValue("a1", forKey: "ans1")
        UserDefaults.standard.setValue("a2", forKey: "ans2")
        UserDefaults.standard.setValue("a3", forKey: "ans3")
        
    }
}
