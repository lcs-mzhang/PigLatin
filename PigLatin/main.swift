//
//  main.swift
//  PigLatin
//

import Foundation

// INPUT
// Global variable, tracks how many words we can expect to have to translate to Pig Latin
var expectedWords = 0
while true {
    print("How many words will be provided?")
    guard let givenInput = readLine() else {
        continue
    }
    guard let integerInput = Int(givenInput) else {
        continue
    }
    if integerInput < 0 || integerInput > 10 {
        continue
    }
    expectedWords = integerInput
    break
}

// PROCESS & OUTPUT
// Implement the primary logic of the problem here
// Some output may be given here if you desire

// Collect the words to be translated
for counter in 1...expectedWords {
    
    var translated = ""
    var firstVowel = ""
    var beforeVowel = ""
    var afterVowel = ""
    
    print("Enter word #\(counter):")
    guard let givenInput = readLine() else {
        continue
    }

    for character in givenInput {
        switch character {
        case "A", "E", "I", "O", "U", "Y":
            if firstVowel == "" {
            firstVowel += String(character)
            } else {
                afterVowel += String(character)
            }
            break
        default:
            if firstVowel == "" {
                beforeVowel += String(character)
            } else {
                afterVowel += String(character)
            }
        }
    }
    
    translated += firstVowel
    translated += afterVowel
    translated += beforeVowel
    translated += "AY"
    
    print("In pig latin: \(translated)")
}
