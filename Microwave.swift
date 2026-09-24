//
//  Microwave.swift
//  Unit1-03 Swift Microwave
//

import Foundation

// Base heating times in seconds
let subTime: Double = 60.0
let pizzaTime: Double = 45.0
let soupTime: Double = 105.0

// Time multipliers for quantity
let oneItem: Double = 1.0
let twoItems: Double = 1.5
let threeItems: Double = 2.0

// Seconds per minute conversion
let secondsPerMinute: Double = 60.0

// Welcome message for user
print("This program calculates microwave reheat time.")

// Asks user for item to heat
print("Please enter the item you want to reheat (sub, pizza, soup): ", terminator: "")

// Reads user input, removes extra spaces, and converts to lowercase
if let foodInput = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
    // Declared as 'let' constant and initialized inside if-else block
    let baseTime: Double

    // Determines baseTime for each item based on foodInput
    if foodInput == "sub" {
        baseTime = subTime
    } else if foodInput == "pizza" {
        baseTime = pizzaTime
    } else if foodInput == "soup" {
        baseTime = soupTime
    } else {
        // Displays error message if user enters invalid food and exits
        print("Error: Invalid food choice. Choose sub, pizza, or soup.")
        exit(0)
    }

    // Asks user for number of items to reheat
    print("Please enter how many items you want to reheat (Max 3): ", terminator: "")

    // Reads quantity input string and converts it to an integer
    if let quantityString = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines),
       let quantity = Int(quantityString) {

        // Declared as 'let' constant and initialized inside if-else block
        let multiplier: Double

        // Checks quantity and sets multiplier value
        if quantity == 1 {
            multiplier = oneItem
        } else if quantity == 2 {
            multiplier = twoItems
        } else if quantity == 3 {
            multiplier = threeItems
        } else {
            // Displays error message if quantity is not between 1 and 3 and exits
            print("Error: Quantity must be 1, 2, or 3.")
            exit(0)
        }

        // Calculates total heating time in seconds and minutes
        let totalSeconds = baseTime * multiplier
        let totalMinutes = totalSeconds / secondsPerMinute

        // Prints calculated total time formatted to 2 decimal places
        print(String(format: "Total heating time: %.2f seconds (%.2f minutes)",
                     totalSeconds, totalMinutes))
    } else {
        // Displays error message if user enters text instead of a whole number
        print("Error: Invalid quantity. Please enter a whole number (1, 2, or 3).")
    }
}