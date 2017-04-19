//
//  ViewController.swift
//  TrueFalseStarter
//
//  Orginally Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//
//  Treehouse iOS TechDegree Project 2 - Enhancing a Quiz App in iOS
//  James D. McMillan started 6/27/2016
//

import UIKit
import GameKit
import AudioToolbox
import FirebaseDatabase
import FirebaseStorage
import Firebase
class QwizSongViewController: UIViewController {
    var olympicTriviaQuestions: [Trivia] = []
    // removed the 'magic number' of 4 that was in the starter and replaced with .count to adjust to the amount of questions in the TriviaModel
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var previousQuestionsArray: [Int] = []
    var  questionsPerRound : Int = 0
    // Sound Effects Variables
    
   
    
    var gameSound: SystemSoundID = 0
    // global variables for the additional sound effects
    var gameSoundCorrect: SystemSoundID = 0
    var gameSoundWrong: SystemSoundID = 0
    var gameSoundFinished: SystemSoundID = 0
    var gameSoundRetry: SystemSoundID = 0
    var gameSoundTimerEnd: SystemSoundID = 0
    
    // Lightning Timer Variables
    
    var lightningTimer = Timer()
    var seconds = 15
    var timerRunning = false
    var i = 0
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bbbbbbc ()
            //   loadGameStartSound()
        // Start game
  
   
        playGameStartSound()
  
     
       
        
        // displayQuestion()

                 }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // locking screen orientation into Portrait Mode only
    
    override var shouldAutorotate : Bool {
        return false
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    func displayQuestion() {
        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: olympicTriviaQuestions.count  )
        
        // while loop for making sure that questions are not repeated
        while previousQuestionsArray.contains(indexOfSelectedQuestion) {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: olympicTriviaQuestions.count  )
        }
        
        // appending global previousQuestionsArray varialbe with asked questions so that they are not repeated
        previousQuestionsArray.append(indexOfSelectedQuestion)
  
        let triviaQuestions = olympicTriviaQuestions[indexOfSelectedQuestion]
        questionField.text = triviaQuestions.question
        playAgainButton.isHidden = true
        
        
        enableButtons()
        
        // Display choice text in answer buttons
         buttoi(VV:triviaQuestions.Imageee)
        firstChoiceButton.setTitle(triviaQuestions.firstChoice, for: UIControlState())
        secondChoiceButton.setTitle(triviaQuestions.secondChoice, for: UIControlState())
        thirdChoiceButton.setTitle(triviaQuestions.thirdChoice, for: UIControlState())
        fourthChoiceButton.setTitle(triviaQuestions.fourthChoice, for: UIControlState())
       
        
        print("questionsPerRound  ",questionsPerRound)
        print("questionsAsked ",questionsAsked)
        resetTimer()
        beginTimer()
    }
    func buttoi(VV:String) {
        
        logoView.image =
            NSURL(string:VV)
                .flatMap { NSData(contentsOf: $0 as URL) }
                .flatMap { UIImage(data: $0 as Data) }
    }
    
    func displayScore() {
        // Hide the answer buttons
        firstChoiceButton.isHidden = true
        secondChoiceButton.isHidden = true
        thirdChoiceButton.isHidden = true
        fourthChoiceButton.isHidden = true
        timerLabel.isHidden = true
        logoView.isHidden = true

        
        // Display play again button
        playAgainButton.isHidden = false
        
        if correctQuestions == questionsAsked {
            questionField.text = "Vous avez gagné l'OR! \n Vous avez \(correctQuestions) sur \(questionsPerRound) correct!"
            loadGameSoundFinished()
            playGameSoundFinished()
            
        } else if correctQuestions <= 11 && correctQuestions >= 10 {
            questionField.text = "Vous avez gagné l'ARGENT! \n Vous avez \(correctQuestions) sur \(questionsPerRound)"
            loadGameSoundFinished()
            playGameSoundFinished()
            
        } else if correctQuestions <= 9 && correctQuestions >= 8 {
            questionField.text = "Vous avez gagné le BRONZE! \n Vous avez \(correctQuestions) sur \(questionsPerRound)"
            loadGameSoundFinished()
            playGameSoundFinished()
            
        } else {
            questionField.text = "Réessayer!\n Vous avez \(correctQuestions) sur \(questionsPerRound)"
            loadGameSoundRetry()
            playGameSoundRetry()
        }
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
    
        let selectedQuestionDict = olympicTriviaQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.correctAnswer
        
        if sender.titleLabel!.text == correctAnswer {
            correctQuestions += 1
            questionField.text = "Correct!"
            disableButtons()
            loadGameSoundCorrect()
            playGameSoundCorrect()
            lightningTimer.invalidate()
        } else {
            questionField.text = "Désolé, mauvaise réponse!! \n\n Réponse correcte: \(correctAnswer)"
            loadGameSoundWrong()
            playGameSoundWrong()
            disableButtons()
            lightningTimer.invalidate()
        }
        
        loadNextRoundWithDelay(seconds: 3)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            lightningTimer.invalidate()
            resetTimer()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        firstChoiceButton.isHidden = false
        secondChoiceButton.isHidden = false
        thirdChoiceButton.isHidden = false
        fourthChoiceButton.isHidden = false
        timerLabel.isHidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        previousQuestionsArray.removeAll()
        playGameStartSound()
        nextRound()
        
    }
    
    // Lightning Timer Methods
    
    func beginTimer() {
        
        if timerRunning == false {
            
            lightningTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QwizSongViewController.countdownTimer), userInfo: nil, repeats: true)
            
            timerRunning = true
        }
    }
    
    func countdownTimer() {
        
        let selectedQuestionDict = olympicTriviaQuestions[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.correctAnswer
        
        // countdown by 1 second
        
        seconds -= 1
        
        timerLabel.text = "Quelques secondes restant: \(seconds)"
        
        if seconds == 0 {
            
            lightningTimer.invalidate()
            
            questionsAsked += 1
            
            questionField.text = "Désolé, le temps s'est écoulé! \n\n Correct Answer: \(correctAnswer)"
            
            loadGameSoundTimerEnd()
            playGameSoundTimerEnd()
            
            disableButtons()
            
            loadNextRoundWithDelay(seconds: 3)
            
        }
        
    }
    
    func resetTimer() {
        
        seconds = 15
        timerLabel.text = "Quelques secondes restent: \(seconds)"
        timerRunning = false
        
    }
    
    
    // MARK: Helper Methods
    
    // Helper Method to enable and disable the buttons after user has answered a question or began another
    
    func enableButtons() {
        
        firstChoiceButton.isUserInteractionEnabled = true
        secondChoiceButton.isUserInteractionEnabled = true
        thirdChoiceButton.isUserInteractionEnabled = true
        fourthChoiceButton.isUserInteractionEnabled = true
        
    }
    
    func disableButtons() {
        
        firstChoiceButton.isUserInteractionEnabled = false
        secondChoiceButton.isUserInteractionEnabled = false
        thirdChoiceButton.isUserInteractionEnabled = false
        fourthChoiceButton.isUserInteractionEnabled = false
        
    }
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
        
    }
    
    
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    // Adding new soundeffects helper methods
    
    func loadGameSoundCorrect() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSoundCorrect", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSoundCorrect)
    }
    
    func playGameSoundCorrect() {
        AudioServicesPlaySystemSound(gameSoundCorrect)
    }
    
    func loadGameSoundWrong() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSoundWrong", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSoundWrong)
    }
    
    func playGameSoundWrong() {
        AudioServicesPlaySystemSound(gameSoundWrong)
    }
    
    func loadGameSoundTimerEnd() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSoundTimerEnd", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSoundTimerEnd)
    }
    
    func playGameSoundTimerEnd() {
        AudioServicesPlaySystemSound(gameSoundTimerEnd)
    }
    
    func loadGameSoundFinished() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSoundFinished", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSoundFinished)
    }
    
    func playGameSoundFinished() {
        AudioServicesPlaySystemSound(gameSoundFinished)
    }
    
    func loadGameSoundRetry() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSoundRetry", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSoundRetry)
    }
    
    func playGameSoundRetry() {
        AudioServicesPlaySystemSound(gameSoundRetry)
    }
    
    
    func  bbbbbbc () {
        
        let ref: FIRDatabaseReference!
        ref = FIRDatabase.database().reference()
        //var i : Int = 1
        var stringValue: String = "1"
        
        var  count: Int = 0
        let nbDeLignes: Int = 0
        
         print(nbDeLignes)
        
        ref.child("qwiz").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if !( snapshot.value  is NSNull){
                
                count = Int(snapshot.childrenCount )
           //     print("count",count)
                for nbDeLignes in 0...(count+1) {
                    
                    self.butto(VV:stringValue)
                    count += 1
                    stringValue = "\(nbDeLignes)"
                    
                }
                
            }
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        
        
        
        
    }
    
    func butto(VV:String) {
        
        let ref: FIRDatabaseReference!
        
        ref = FIRDatabase.database().reference()
        
        
        
        
        ref.child("qwiz").child(VV).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            
            
            if !( snapshot.value  is NSNull){
                
                
                
                let value = snapshot.value as? NSDictionary
                let choix1 = value?["choix1"] as? String ?? ""
                let choix2 = value?["choix2"] as? String ?? ""
                let choix3 = value?["choix3"] as? String ?? ""
                let choix4 = value?["choix4"] as? String ?? ""
                let question = value?["question"] as? String ?? ""
                let Breponse = value?["reponse"] as? String ?? ""
                let IMAGE = value?["image"] as? String ?? ""
          
                let room = Trivia(question:question ,
                                  firstChoice: choix2,
                                  secondChoice: choix3,
                                  thirdChoice: choix1,
                                  fourthChoice: choix4,
                                  correctAnswer: Breponse,
                                   Imageee:IMAGE
                                  )
                
                
                
                
                
                
                self.olympicTriviaQuestions.append(room)
                self.olympicTriviaQuestions.insert(room, at: self.i)
                self.i += 1
                self.questionsPerRound += 1
                
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
 
    
    
    
}

