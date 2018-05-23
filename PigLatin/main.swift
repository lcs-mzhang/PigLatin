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
    } //filter out nil input. if invalid input is given, keep prompting until valid input is given.
    guard let integerInput = Int(givenInput) else {
        continue
    } //filter out non-integer input. if invalid input is given, keep prompting until valid input is given.
    if integerInput < 0 || integerInput > 10 {
        continue
    } //filter out integer input that is less than 0 or more than 10. if invalid input is given, keep prompting until valid input is given.
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
    } //collects user input

    for character in givenInput {
        switch character {
        case "A", "E", "I", "O", "U", "Y":
            if firstVowel == "" {
            firstVowel += String(character)
            } else { //if a vowel has not been detected, designate the current vowel as the first vowel
                afterVowel += String(character)
            } //if a vowel has been detected, add the current vowel to the string of letters after the first vowel
            break
        default:
            if firstVowel == "" {
                beforeVowel += String(character)
            } else { //if a consonant is detected before the first vowel is found, add it to a string of letters before the first vowel
                afterVowel += String(character)
            } //if a consonant is detected after the first vowel is found, add it to a string of letters after the first vowel
        }
    }
    
    translated += firstVowel
    translated += afterVowel
    translated += beforeVowel
    translated += "AY"

    //arrange the first vowel, pre-vowel letters, post-vowel letters according to the rules of pig latin and add ay to the end
    
    print("In pig latin: \(translated)")
}
