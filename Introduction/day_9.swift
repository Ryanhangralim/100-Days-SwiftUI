import Cocoa

// DAY 9
// Copying function 
// func greetUser() {
//     print("Hi there!")
// }

// greetUser()

// var greetCopy = greetUser
// greetCopy()


// // Closure expression
// let sayHello = {
//     print("Hello there!")
// }

// sayHello()

// // Closure with parameter
// let sayHelloTo = { (name: String) -> String in 
//     return "Hello there \(name)!"
// }

// print(sayHelloTo("RyanH"))

// // external parameter names only matter when we’re calling a function directly, not when we create a closure or when we take a copy of the function first.
// func getUserData(for id: Int) -> String {
//     if id == 1989 {
//         return "Taylor Swift"
//     } else {
//         return "Anonymous"
//     }
// }

// let data: (Int) -> String = getUserData
// let user = data(1989)
// print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

// func captainFirstSorted(name1: String, name2: String) -> Bool {
//     if name1 == "Suzanne" {
//         return true
//     } else if name2 == "Suzanne" {
//         return false
//     }

//     return name1 < name2
// }

// let captainFirstTeam = team.sorted(by: captainFirstSorted)
// print(captainFirstTeam)

// let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//     if name1 == "Suzanne" {
//         return true
//     } else if name2 == "Suzanne" {
//         return false
//     }

//     return name1 < name2
// })

// print(captainFirstTeam)

// // Trailing Closure Syntax
// let captainFirstTeam = team.sorted { name1, name2 in
//     if name1 == "Suzanne" {
//         return true
//     } else if name2 == "Suzanne" {
//         return false
//     }

//     return name1 < name2
// }

// // Shorthand Syntax
// let captainFirstTeam = team.sorted {
//     if $0 == "Suzanne" {
//         return true
//     } else if $1 == "Suzanne" {
//         return false
//     }

//     return $0 < $1
// }

// // Reverse Sort
// let reverseTeam = team.sorted { $0 > $1 }
// print(reverseTeam)

// // Function as parameter
// func makeArray(size: Int, using generator: () -> Int) -> [Int] {
//     var numbers = [Int]()

//     for _ in 0..<size {
//         let newNumber = generator()
//         numbers.append(newNumber)
//     }

//     return numbers
// }

// let rolls = makeArray(size: 50) {
//     Int.random(in: 1...20)
// }

// print(rolls)

// // Using dedication function works too
// func generateNumber() -> Int {
//     Int.random(in: 1...20)
// }

// let newRolls = makeArray(size: 50, using: generateNumber)
// print(newRolls)

// // Multiple Function as Parameter
// func doImportantWork(count: Int, first: () -> Void, second: () -> Void, third: () -> Void) {
//     print("Count: \(count)")
//     print("About to start first work")
//     first()
//     print("About to start second work")
//     second()
//     print("About to start third work")
//     third()
//     print("Done!")
// }

// doImportantWork(count:10) {
//     print("This is the first work")
// } second: {
//     print("This is the second work")
// } third: {
//     print("This is the third work")
// }

//// Checkpoint 5
// Your input is this:

// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// Your job is to:

// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format “7 is a lucky number”
// Print the resulting array, one item per line
// So, your output should be as follows:

// 7 is a lucky number
// 15 is a lucky number
// 21 is a lucky number
// 31 is a lucky number
// 33 is a lucky number
// 49 is a lucky number 

// luckyNumbers
//     .filter { $0 % 2 != 0 } // Keep only odd numbers
//     .sorted() // Sort in ascending order
//     .map { "\($0) is a lucky number" } // Format as strings
//     .forEach { print($0) } // Print each result

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func processNumbers(for numbers: [Int], 
                    first: ([Int]) -> [Int], 
                    second: ([Int]) -> [Int], 
                    third: ([Int]) -> [String], 
                    fourth: ([String]) -> Void) {
    fourth(third(second(first(numbers))))
}

processNumbers(
    for: luckyNumbers,
    first: { $0.filter { !$0.isMultiple(of:2) } }, // Keep only odd numbers
    second: { $0.sorted() }, // Sort in ascending order
    third: { $0.map { "\($0) is a lucky number" } }, // Format as strings
    fourth: { $0.forEach { print($0) } } // Print each formatted string
)
