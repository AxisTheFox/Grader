//
//  ViewController.swift
//  FoxBraydonAssignment1Part2
//
//  Created by Fox, Braydon on 10/2/16.
//  Copyright © 2016 Fox, Braydon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var quizScoreTextField: UITextField!
    @IBOutlet weak var assignmentScoreTextField: UITextField!
    @IBOutlet weak var midtermExamScoreTextField: UITextField!
    @IBOutlet weak var finalExamScoreTextField: UITextField!
    @IBOutlet weak var letterGradeLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var totalAverageScore = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        letterGradeLabel.text = ""
        percentageLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func calculateButton(sender: AnyObject) {
        if (anyFieldsAreEmpty()) {
            createEmptyFieldAlert()
        } else {
            calculateTotalScore()
            calculateLetterGrade()
        }
    }
    
    // MARK: Methods
    func anyFieldsAreEmpty() -> Bool {
        return quizScoreTextField.text == "" || assignmentScoreTextField.text == "" || midtermExamScoreTextField.text == "" || finalExamScoreTextField.text == ""
    }
    
    func createEmptyFieldAlert() {
        let emptyFieldAlert = UIAlertController(title:"Empty Scores", message:"One or more score fields are empty.", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) {
            (action) in
        }
        emptyFieldAlert.addAction(OKAction)
        self.presentViewController(emptyFieldAlert, animated: true, completion: nil)
    }
    
    func calculateTotalScore() {
        let quizScorePercentage = (Double(quizScoreTextField.text!)! * 0.15)
        let assignmentScorePercentage = (Double(assignmentScoreTextField.text!)! * 0.4)
        let midtermExamScorePercentage = (Double(midtermExamScoreTextField.text!)! * 0.2)
        let finalExamScorePercentage = (Double(finalExamScoreTextField.text!)! * 0.25)
        
        totalAverageScore = quizScorePercentage + assignmentScorePercentage + midtermExamScorePercentage + finalExamScorePercentage
        
        percentageLabel.text = "\(String(totalAverageScore))%"
    }
    
    func calculateLetterGrade() {
        var letterGrade = ""
        if (totalAverageScore >= 90) {
            letterGrade = "A"
        } else if (totalAverageScore >= 80) {
            letterGrade = "B"
        } else if (totalAverageScore >= 70) {
            letterGrade = "C"
        } else if (totalAverageScore >= 60) {
            letterGrade = "D"
        } else {
            letterGrade = "F"
        }
        letterGradeLabel.text = letterGrade
    }


}

