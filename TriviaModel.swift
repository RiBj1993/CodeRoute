//
//  TriviaModel.swift
//  QuizApp
//
//  Created by James McMillan on 6/28/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


// declarring a class containing the data set for the trivia questions and answers
// thirdChoice and fourthChoice are optionals as they will be part of True/False questions
import FirebaseDatabase
import FirebaseStorage
import Firebase

class Trivia {
    
    let question: String
    let firstChoice: String
    let secondChoice: String
    let thirdChoice: String
    let fourthChoice: String
    let correctAnswer: String
   
   
  
    init(question: String, firstChoice: String, secondChoice: String, thirdChoice: String, fourthChoice: String, correctAnswer: String) {
        self.question = question
        self.firstChoice = firstChoice
        self.secondChoice = secondChoice
        self.thirdChoice = thirdChoice
        self.fourthChoice = fourthChoice
        self.correctAnswer = correctAnswer
        
      bbbbbbc()
      
        }
        
   
   
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
              print("count",count)
            for nbDeLignes in 0...(count+1) {
                print("\(nbDeLignes). Je dois apprendre mes leçons en cours de Swift.")
                butto(VV:stringValue)
                count += 1
                stringValue = "\(nbDeLignes)"
               print("stringValue",stringValue)
            }

        }
    }) { (error) in
        print(error.localizedDescription)
    }
    
   
    
    
    
   

}

func butto(VV:String) {
    
    let ref: FIRDatabaseReference!
    
    ref = FIRDatabase.database().reference()
    
    // Use you snapshot(FIRDataSnapshot) to create the data of the room.
   var  TriviaList : Array<Trivia> = Array()
    
    ref.child("qwiz").child(VV).observeSingleEvent(of: .value, with: { (snapshot) in
        // Get user value
        
       if !( snapshot.value  is NSNull){
            
            
            
            let value = snapshot.value as? NSDictionary
            let choix1 = value?["choix1"] as? String ?? ""
            let choix2 = value?["choix2"] as? String ?? ""
            let choix3 = value?["choix3"] as? String ?? ""
            let choix4 = value?["choix4"] as? String ?? ""
            let Breponse = value?["reponse"] as? String ?? ""
            let IMAGE = value?["image"] as? String ?? ""
            print(choix1)
            print(choix2)
            print(choix3)
            print(choix4 )
            print(IMAGE)
            print(Breponse)
            print("ppppppppppppppp",snapshot.childrenCount)
        let room = Trivia(question: choix1,
                          firstChoice: choix2,
                          secondChoice: choix3,
                          thirdChoice: Breponse,
                          fourthChoice: IMAGE,
                          correctAnswer: Breponse)
        

     
        
    

        TriviaList.append(room)
        
        var i = 0
        while i < TriviaList.count
        {
            olympicTriviaQuestions[i] = TriviaList.index(i, offsetBy: 1)
            i += 1
        }
        }
    }) { (error) in
        print(error.localizedDescription)
    }
}
// trivia questions with answer choices and correctAnswer declared

let triviaQuestion01 = Trivia(question: "In which city were the first Modern Olympics held",
                              firstChoice: "Munich",
                              secondChoice: "Paris",
                              thirdChoice: "Geneva",
                              fourthChoice: "Athens",
                              correctAnswer: "Athens")

let triviaQuestion02 = Trivia(question: "In which year were the first Modern Olympics held",
                              firstChoice: "1888",
                              secondChoice: "1896",
                              thirdChoice: "1900",
                              fourthChoice: "1908",
                              correctAnswer: "1896")

let triviaQuestion03 = Trivia(question: "What is the meaning of the Olympic Motto, 'Citius, Altius, Fortius.'",
                              firstChoice: "Citidel, Attitude, Fortitude",
                              secondChoice: "Faster, Higher, Stronger",
                              thirdChoice: "Civility, Attainment, Fortune",
                              fourthChoice: "Quicker, Heavier, Taller",
                              correctAnswer: "Faster, Higher, Stronger")

let triviaQuestion04 = Trivia(question: "Which city last hosted the Summer Games in North America held?",
                              firstChoice: "Los Angeles",
                              secondChoice: "Atlanta",
                              thirdChoice: "Salt Lake City",
                              fourthChoice: "New York City",
                              correctAnswer: "Atlanta")

let triviaQuestion05 = Trivia(question: "Golf returns to the olympics in 2016, what year was it last played?",
                              firstChoice: "1904",
                              secondChoice: "1924",
                              thirdChoice: "1896",
                              fourthChoice: "1948",
                              correctAnswer: "1904")

let triviaQuestion06 = Trivia(question: "What was the last year that Tug-of-War was an olympic sport?",
                              firstChoice: "1996",
                              secondChoice: "2000",
                              thirdChoice: "1900",
                              fourthChoice: "1920",
                              correctAnswer: "1920")

let triviaQuestion07 = Trivia(question: "How many events are in the Decathlon?",
                              firstChoice: "5",
                              secondChoice: "7",
                              thirdChoice: "10",
                              fourthChoice: "8",
                              correctAnswer: "10")

let triviaQuestion08 = Trivia(question: "Michael Phelps holds the most medals ever won, how many is it?",
                              firstChoice: "22",
                              secondChoice: "33",
                              thirdChoice: "25",
                              fourthChoice: "18",
                              correctAnswer: "22")

let triviaQuestion09 = Trivia(question: "The Summer Games in 2020 are to be held in which city?",
                              firstChoice: "Los Angeles",
                              secondChoice: "Paris",
                              thirdChoice: "Tokyo",
                              fourthChoice: "Moscow",
                              correctAnswer: "Tokyo")

let triviaQuestion10 = Trivia(question: "What is the only Olympic sport in which men and women compete against each other?",
                              firstChoice: "Tennis",
                              secondChoice: "Basketball",
                              thirdChoice: "Field Hockey",
                              fourthChoice: "Equestrian",
                              correctAnswer: "Equestrian")

let triviaQuestion11 = Trivia(question: "What Olympic Sport has the USA never won a medal in?",
                              firstChoice: "Badminton",
                              secondChoice: "Field Hockey",
                              thirdChoice: "Table Tennis",
                              fourthChoice: "Handball",
                              correctAnswer: "Badminton")

let triviaQuestion12 = Trivia(question: "When was the first Olympic torch relay held?",
                              firstChoice: "1896",
                              secondChoice: "1948",
                              thirdChoice: "1920",
                              fourthChoice: "1936",
                              correctAnswer: "1936")

var olympicTriviaQuestions = [triviaQuestion01,
                              triviaQuestion02,
                              triviaQuestion03,
                              triviaQuestion04,
                              triviaQuestion05,
                              triviaQuestion06,
                              triviaQuestion07,
                              triviaQuestion08,
                              triviaQuestion09,
                              triviaQuestion10,
                              triviaQuestion11,
                              triviaQuestion12
]


