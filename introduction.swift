import Cocoa

// DAY 1
//var greeting = "Hello, playground"
//
//// Constants (let)
//let character = "Daphne"
//
//print(character + " Hi")
//
//let movie = """
//A day in the 
//life of an 
//Apple Engineer
//"""
//
//// Prints the length of the string
//print(movie.count)
//// Prints uppercased
//print(movie.uppercased())
//// Check if the string has a prefix
//print(movie.hasPrefix("A"))
//// Check if the string has a suffix
//print(movie.hasSuffix("dog"))
//
//let numberOfApples: Int = 12
//var numberOfOranges: Int = 3
//
//print(numberOfApples + numberOfOranges)
//
//numberOfOranges += 2
//
//print(numberOfApples + numberOfOranges)
//
//print(numberOfApples.isMultiple(of: 2))
//
////Decimals and numbers
//let a = 1
//let b = 2.5
//let c = Double(a) + b
//print(c)

//------------------------------------------------------------------------

// DAY 2
//var gameOver = false
//print(gameOver)
//gameOver = !gameOver
//print(gameOver)
//gameOver.toggle( )
//print(gameOver)
//
//// String Interpolation
//let name = "Daphne"
//let age = 25
//let greeting2 = "Hello, my name is \(name) and I am \(age) years old."
//print(greeting2)
//print("Hello, my name is " + name + " and I am " + String(age) + " years old.")

// Checkpoint 1
//let celcius = 100
//let fahrenheit = (celcius * 9 / 5) + 32
//print("Celcius: \(celcius)°C is equal to \(fahrenheit)°F")

//------------------------------------------------------------------------

// DAY 3
//var characters : [String] = ["Billy Summers", "Alice Maxwell", "Jake Epping", "Saddie Dunhill"]
//characters.append("Harry Dunning")
//print(characters)
//characters.remove(at: 3)
//print(characters)
//
//var numbers = Array<Int>(repeating: 0, count: 10)
//print(numbers)
//var numbers2 = [Int](repeating: 0, count:10)
//print(numbers2)
//numbers2.removeAll()
//print(numbers2.count)
//
//print(characters.contains("Paul"))
//print(characters.sorted())
//print(characters.reversed())
//print(characters.joined(separator: ", "))
//print("sorted".reversed())

//let book = [
//    "title" : "11/22/63",
//    "pages" : "384",
//    "author" : "Stephen King",
//    "genre" : "Time Travel",
//    "publish_date" : "1982-07-01"
//]
//
//print("Book Information: Title: \(book["title"] ?? "Unknown"), Author: \(book["author"] ?? "Unknown"), Genre: \(book["genre", default: "Unknown"])")
//print(book["age", default: "Unknown"])
//
//// Create empty dictionary using explicit types
//var heights = [String: Int]()
//heights["Alice"] = 160
//heights["Bob"] = 170
//
//print(heights)
//
//var heights2: [String: Int] = [:]
//heights2["Alice"] = 160
//heights2["Bob"] = 170
//print(heights2)
//
//heights["Alice"] = 165
//print(heights)
//
//// Sets
//let books = Set(["Billy Summers", "The Silent Patient", "11/22/63", "Five Survive"])
//print(books)
//
//var books2 = Set<String>()
//books2.insert("Billy Summers")
//books2.insert("The Silent Patient")
//books2.insert("11/22/63")
//books2.insert("Five Survive")
//print(books2)
//
//// Enumeration
//enum Weekday {
//    case monday
//    case tuesday
//    case wednesday
//    case thursday
//    case friday
//}
//
//enum Weekday2 {
//    case monday, tuesday, wednesday, thursday, friday
//}
//
//var day = Weekday.monday
//print(day)
//day = Weekday.tuesday
//print(day)
//day = .friday
//print(day)

//------------------------------------------------------------------------

// DAY 4

//// Type Annotations
//let name: String = "Ryan"
//let age: Int = 20
//let isStudent: Bool = true
//var colors: [String] = ["red", "blue", "green"]
//var user: [String: String] = ["name": "Ryan", "email": "ryan@example.com"]
//var books: Set<String> = Set(["Harry Potter", "The Alchemist", "To Kill a Mockingbird"])
//
//var stringArray1: [String] = [String]()
//var stringArray2: [String] = []
//var stringArray3 = [String]()
//
//// Creating constant variable and initialize it later
//let username: String
//// Complex logic
//username = "RyanH"
//// lots more Complex logic
//print(username)

// Checkpoint 2
// let items: [String] = ["item1", "item2", "item3", "item4"]
// print("Counts : \(items.count)")
// let uniqueItems = Set(items)
// print("Unique Item Count: \(uniqueItems.count)")

//------------------------------------------------------------------------

// DAY 5
// var username = ""

// if username.isEmpty {
//     username = "Anonymous"
// }

// print("Welcome \(username)")

// If else
// enum Transports {
//     case airplane, helicopter, bicycle, car, scooter
// }

// let transport = Transports.car 

// if transport == .airplane || transport == .helicopter {
//     print("Let's Fly!")
// } else if transport == .bicycle {
//     print("I hope there's a bike path...")
// } else if transport == .car {
//     print("Time to get stuck in traffic.")
// } else {
//     print("I'm going to hire a scooter now!")
// }

// Switch
// enum Weather {
//     case sun, rain, wind, snow, unknown
// }

// let forecast = Weather.sun

// switch forecast {
// case .sun:
//     print("It should be a nice day")
// case .rain:
//     print("Pack an umbrella.")
// case .wind:
//     print("Wear something warm")
// case .snow:
//     print("School is cancelled.")
// default:
//     print("We'll have to see")
// }

// let day = 5
// print("My true love gave to me…")

// switch day {
// case 5:
//     print("5 golden rings")
//     fallthrough
// case 4:
//     print("4 calling birds")
//     fallthrough
// case 3:
//     print("3 French hens")
//     fallthrough
// case 2:
//     print("2 turtle doves")
//     fallthrough
// default:
//     print("A partridge in a pear tree")
// }

// Ternary operator
// let hour = 23
// print(hour < 12 ? "It's before noon" : "It's after noon")

// enum Theme {
//     case light, dark
// }

// let theme = Theme.dark 

// let background = theme == .dark ? "black" : "white"
// print(background)

//------------------------------------------------------------------------

// DAY 6

// // For loops
// let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

// for os in platforms {
//     print("Swift works great on \(os).")
// }

// for i in 0..<5{
//     print(i)
// }

// var lyric = "Haters gonna"

// for _ in 0..<5{
//     lyric += " hate"
// }

// print(lyric)

// While loops
// var roll = 0 
// while roll != 20 {
//     roll = Int.random(in: 1...20)
//     print("I rolled a \(roll)")
// }

// print("Critical Hit!")

// let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

// for filename in filenames {
//     if filename.hasSuffix(".jpg") == false {
//         continue
//     }

//     print("Found picture: \(filename)")
// }

// let number1 = 4
// let number2 = 14
// var multiples = [Int]()

// for i in 1...100_000 {
//     if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
//         multiples.append(i)

//         if multiples.count == 10 {
//             break
//         }
//     }
// }

// print(multiples)

// Checkpoint 3 : FizzBuzz
// for i in 1...100 {
//     if i.isMultiple(of: 3) && i.isMultiple(of: 5){
//         print("FizzBuzz")
//     } else if i.isMultiple(of: 3) {
//         print("Fizz")
//     } else if i.isMultiple(of: 5) {
//         print("Buzz")
//     } else {
//         print(i)
//     }
// }

//------------------------------------------------------------------------

// DAY 7

// Functions
// func printTimesTables(number: Int, end: Int) -> Int{
//     var total = 0 
//     for i in 1...end{
//         print("\(i) X \(number) is \(i * number)")
//         total += (i * number)
//     }
//     return total
// }

// print("Result: " + String(printTimesTables(number: 5, end: 10)))


// func pythagoras(a: Double, b: Double) -> Double {
//     sqrt(a * a + b * b)
// }

// print("Result: " + String(pythagoras(a: 3, b: 4)))

// Returning multiple values (tuple)
// func getUser() -> (firstName: String, lastName: String) {
//     (firstName: "Taylor", lastName: "Swift")
// }

// let (firstName, lastName) = getUser()
// print("Name: \(firstName) \(lastName)")

// let user = getUser()
// print("Name: \(user.0) \(user.1)")

// // _ omits parameter
// func isUppercase(_ string: String) -> Bool {
//     string == string.uppercased()
// }

// let string = "HELLO, WORLD"
// let result = isUppercase(string)
// print(result)

// // replace parameter name
// func printTimesTables(for number: Int) {
//     for i in 1...12 {
//         print("\(i) x \(number) is \(i * number)")
//     }
// }

// printTimesTables(for: 5)

//------------------------------------------------------------------------

// DAY 8

// Default Parameter
// func printTimesTables(for number: Int, end: Int = 12) {
//     for i in 1...end {
//         print("\(i) x \(number) is \(i * number)")
//     }
// }

// printTimesTables(for: 5, end: 20)
// printTimesTables(for: 8)

// Error handling
// Steps
// This takes three steps:

// 1. Telling Swift about the possible errors that can happen.
// 2. Writing a function that can flag up errors if they happen.
// 3. Calling that function, and handling any errors that might happen.

// enum PasswordError: Error {
//     case short, obvious
// }

// // throws : indicates that the functin can throw error
// func checkPassword(_ password: String) throws -> String {
//     if password.count < 5 {
//         throw PasswordError.short
//     }

//     if password == "12345" {
//         throw PasswordError.obvious
//     }

//     if password.count < 8 {
//         return "OK"
//     } else if password.count < 10 {
//         return "Good"
//     } else {
//         return "Excellent"
//     }
// }

// let string = "1234578978798"

// do {
//     let result = try checkPassword(string)
//     print("Password rating: \(result)")
// } catch PasswordError.short {
//     print("Please use a longer password.")
// } catch PasswordError.obvious {
//     print("I have the same combination on my luggage!")
// } catch {
//     print("There was an error.")
// }

// Checkpoint 4
// The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

// 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
// 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
// 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
// 4. If you can’t find the square root, throw a “no root” error.
// As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

// enum NumberError: Error{
//     case outOfBounds, noRoot
// }

// func squareRoot(_ number: Int) throws -> Int {
//     if number < 1 || number > 10_000{
//         throw NumberError.outOfBounds
//     } else {
//         for i in 1...100{
//             if number == i * i{
//                 return i
//             }
//         }
//         throw NumberError.noRoot
//     }
// }


// func findSquareRoot(_ number: Int) {
//     do {
//         let result = try squareRoot(number)
//         print("Square Root of \(number) is \(result)")
//     } catch NumberError.outOfBounds {
//         print("Number must be 1 through 10.000")
//     } catch NumberError.noRoot {
//         print("No root found for number \(number)")
//     } catch {
//         print("There was an error.")
//     }
// }

// findSquareRoot(2500)

//------------------------------------------------------------------------

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

// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// func processNumbers(for numbers: [Int], 
//                     first: ([Int]) -> [Int], 
//                     second: ([Int]) -> [Int], 
//                     third: ([Int]) -> [String], 
//                     fourth: ([String]) -> Void) {
//     fourth(third(second(first(numbers))))
// }

// processNumbers(
//     for: luckyNumbers,
//     first: { $0.filter { !$0.isMultiple(of:2) } }, // Keep only odd numbers
//     second: { $0.sorted() }, // Sort in ascending order
//     third: { $0.map { "\($0) is a lucky number" } }, // Format as strings
//     fourth: { $0.forEach { print($0) } } // Print each formatted string
// )

//------------------------------------------------------------------------

// DAY 10
// struct Employee {
//     let name: String
//     var vacationRemaining: Int

//     mutating func takeVacation(days: Int) {
//         if vacationRemaining > days {
//             vacationRemaining -= days
//             print("I'm going on vacation!")
//             print("Days remaining: \(vacationRemaining)")
//         } else {
//             print("Oops! There aren't enough days remaining.")
//         }
//     }
// }

// var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
// archer.takeVacation(days: 5)
// print(archer.vacationRemaining)

// // Same thing (Swift silently creates a special function (init) inside the struct)
// var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
// var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

// Swift is intelligent in the way it generates its initializer, even inserting default values if we assign them to our properties.

// For example, if our struct had these two properties

// let name: String
// var vacationRemaining = 14
// Then Swift will silently generate an initializer with a default value of 14 for vacationRemaining, making both of these valid:

// let kane = Employee(name: "Lana Kane")
// let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// // Compute property values dynamically
// struct Employee {
//     let name: String
//     var vacationAllocated = 14
//     var vacationTaken = 0

//     var vacationRemaining: Int { // Computed property
//         get {
//             vacationAllocated - vacationTaken
//         }

//         set {
//             vacationAllocated = vacationTaken + newValue
//         }
//     }
// }

// var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
// archer.vacationTaken += 4
// archer.vacationRemaining = 5
// print(archer.vacationAllocated)

// // Take action when property changes
// struct App {
//     var contacts = [String]() {
//         willSet {
//             print("Current value is: \(contacts) (willSet)")
//             print("New value will be: \(newValue) (willSet)")
//         }

//         didSet {
//             print("There are now \(contacts.count) contacts. (didSet)")
//             print("Old value was \(oldValue) (didSet)")
//         }
//     }
// }

// var app = App()
// app.contacts.append("Adrian E")
// app.contacts.append("Allen W")
// app.contacts.append("Ish S")

// // Practice
// struct People{
//     let name: String
//     var age: Int = 0
//     var friends = [String]() {
//         didSet {
//             print("There are now \(friends.count) friends in your contact!")
//         }
//     } 
// }

// var bob = People(name: "Bob")
// bob.friends.append("Amy")
// bob.friends.append("Jill")

// Custom Initializers
// Golden Rule : All properties ust have a value by the time the initializer ends.
// struct Player{
//     let name: String 
//     let number: Int 

//     init(name: String){
//         self.name = name 
//         number = Int.random(in: 1...99)
//     }
// }

// let player = Player(name: "Megan R")
// print(player.number)

//------------------------------------------------------------------------

// DAY 11

// Access Control
// Use private for “don’t let anything outside the struct use this.”
// Use fileprivate for “don’t let anything outside the current file use this.”
// Use public for “let anyone, anywhere use this.”

// There’s one extra option that is sometimes useful for learners, which is this: private(set). This means “let anyone read this property, but only let my methods write it.” If we had used that with BankAccount, it would mean we could print account.funds outside of the struct, but only deposit() and withdraw() could actually change the value.

// struct BankAccount {
//     private(set) var funds = 0

//     mutating func deposit(amount: Int){
//         funds += amount
//     }

//     mutating func withdraw(amount: Int) -> Bool{
//         if funds >= amount{
//             funds -= amount
//             return true
//         } else {
//             return false
//         }
//     }
// }

// var account = BankAccount()
// account.deposit(amount: 100)

// if account.withdraw(amount: 90){
//     print("Withdrew successfully")
//     print("\(account.funds) left in account")
// } else{
//     print("Failed to get money")
// }

// Static properties and methods
// Static --> Don't exist uniquely on instances of the struct. Don't need to create an instance to use.
// struct School {
//     static var studentCount = 0

//     static func add(student: String) {
//         print("\(student) joined the school.")
//         studentCount += 1
//     }
// }

// School.add(student: "Taylor Swift")
// print("Student count: \(School.studentCount)")

// struct AppData {
//     static let version = "1.3 beta 2"
//     static let saveFilename = "settings.json"
//     static let homeURL = "https://www.hackingwithswift.com"
// }

// print(AppData.version)

// struct Employee {
//     let username: String 
//     let password: String 

//     static let example = Employee(username: "tetsusername", password: "testpassword")
// }

// struct Question {
//     static var answer = 42
//     var questionText = "Unknown"
//     init(questionText: String, answer: Int) {
//         Question.answer = answer
//         self.questionText = questionText
//     }
// }

// var question = Question(questionText: "This is a test question", answer: 23)
// print(Question.answer)

// Checkpoint 6
// Create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

// struct Car {
//     private(set) var model : String 
//     private(set) var numberOfSeats : Int 
//     private var currentGear = 1 
//     private static let minGear = 1
//     private static let maxGear = 10

//     init(model: String, numberOfSeats: Int) {
//         self.model = model 
//         self.numberOfSeats = numberOfSeats
//     }

//     // current gear getter
//     var gear: Int {
//         return currentGear
//     }

//     mutating func addGear() -> String {
//         if currentGear < Car.maxGear {
//             currentGear += 1
//             return "Gear moved to \(currentGear)"
//         } else {
//             return "Can't change Gear! Gear is on max level: \(currentGear)"
//         }
//     }

//     mutating func subtractGear() -> String {
//         if currentGear > Car.minGear {
//             currentGear -= 1
//             return "Gear moved to \(currentGear)"
//         } else {
//             return "Can't change Gear! Gear is on min level: \(currentGear)"
//         }
//     }
// }

// var Car1 = Car(model: "Model 1", numberOfSeats: 4)
// print(Car1.model)
// print(Car1.numberOfSeats)
// for _ in 1...11{
//     print(Car1.addGear())
// }
// print(Car1.gear)
// print(Car1.subtractGear())
// print(Car1.gear)

//------------------------------------------------------------------------

// DAY 12
// CLass and struct difference:
// 1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too.
// 2. Because of that first point, Swift won’t automatically generate a memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
// 3. When you copy an instance of a class, both copies share the same data – if you change one copy, the other one also changes.
// 4. When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer.
// 5. Even if you make a class constant, you can still change its properties as long as they are variables.

// class Employee{
//     let hours: Int 
//     init(hours: Int){
//         self.hours = hours 
//     }

//     func printSummary() {
//     print("I work \(hours) hours a day.")
// }
// }

// class Developer:Employee{
//     func work(){
//         print("I'm writing code for \(hours) hours.")
//     }

//     override func printSummary() {
//     print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
// }
// }

// class Manager: Employee {
//     func work() {
//         print("I'm going to meetings for \(hours) hours.")
//     }
// }

// let robert = Developer(hours: 8)
// let joseph = Manager(hours: 10)
// robert.work()
// joseph.work()
// joseph.printSummary()
// let novall = Developer(hours: 8)
// novall.printSummary()

// // Adding initializers
// class Vehicle {
//     let isElectric: Bool

//     init(isElectric: Bool) {
//         self.isElectric = isElectric
//     }
// }

// class Car: Vehicle {
//     let isConvertible: Bool

//     init(isElectric: Bool, isConvertible: Bool) {
//         self.isConvertible = isConvertible
//         super.init(isElectric: isElectric)
//     }
// }

// let teslaX = Car(isElectric: true, isConvertible: false)

// // Doing User1 = User2 will be like making a linked copy (changing an attribute of user1 changes attribute of user2)
// class User {
//     var username = "Anonymous"

//     func copy() -> User {
//         let user = User()
//         user.username = username
//         return user
//     }
// }

// // Deinitializers
// class User {
//     let id: Int

//     init(id: Int) {
//         self.id = id
//         print("User \(id): I'm alive!")
//     }

//     deinit {
//         print("User \(id): I'm dead!")
//     }
// }

// // for i in 1...3 {
// //     let user = User(id: i)
// //     print("User \(user.id): I'm in control!")
// // }

// var users = [User]()

// for i in 1...3 {
//     let user = User(id: i)
//     print("User \(user.id): I'm in control!")
//     users.append(user)
// }

// print("Loop is finished!")
// users.removeAll()
// print("Array is clear!")

// Checkpoint 7
// make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

//But there’s more:

// 1. The Animal class should have a legs integer property that tracks how many legs the animal has.
// 2. The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// 3. The Cat class should have a matching speak() method, again with each subclass printing something different.
// 4. The Cat class should have an isTame Boolean property, provided using an initializer.

// class Animal{
//     let legs : Int 
//     init(legs: Int){
//         self.legs = legs
//     }
// }

// class Dog : Animal{
//     func bark() {
//         print("Woof Woof mf")
//     }

//     // init(legs: Int){
//     //     super.init(legs: 4)
//     // }
// }

// class Corgi : Dog{
//     override func bark(){
//         print("Corgi bark")
//     }
// }

// class Poodle : Dog{
//     override func bark(){
//         print("Poodle bark")
//     }
// }

// class Cat : Animal{
//     let isTame: Bool

//     init(isTame: Bool, legs: Int) {
//         self.isTame = isTame
//         super.init(legs: legs)
//     }

//     func meow(){
//         print("meow meow mf")
//     }
// }

// class Persian : Cat{
//     override func meow(){
//         print("Persian meow")
//     }
// }

// class Lion : Cat{
//     override func meow(){
//         print("Lion meow")
//     }
// }

// var corgi = Corgi(legs: 4)
// corgi.bark()
// var poodle = Poodle(legs: 4)
// poodle.bark()
// var persian = Persian(isTame: true,legs: 4)
// persian.meow()
// var lion = Lion(isTame: false, legs: 4)
// lion.meow()
// var dog = Dog(legs: 4)
// dog.bark()
// var cat = Cat(isTame: true, legs: 4)
// cat.meow()

//------------------------------------------------------------------------

// DAY 13
// protocols let us talk about the kind of functionality we want to work with, rather than the exact types. Rather than saying “this parameter must be a car”, we can instead say “this parameter can be anything at all, as long as it’s able to estimate travel time and move to a new location.”

// protocol Vehicle {
//     var name: String { get }
//     var currentPassengers: Int { get set }
//     func estimateTime(for distance: Int) -> Int
//     func travel(distance: Int)
// }

// struct Car: Vehicle {
//     let name = "Car"
//     var currentPassengers = 1

//     func estimateTime(for distance: Int) -> Int {
//         distance / 50
//     }

//     func travel(distance: Int) {
//         print("I'm driving \(distance)km.")
//     }

//     func openSunroof() {
//         print("It's a nice day!")
//     }
// }

// struct Bicycle: Vehicle {
//     let name = "Bicycle"
//     var currentPassengers = 1

//     func estimateTime(for distance: Int) -> Int {
//         distance / 10
//     }

//     func travel(distance: Int) {
//         print("I'm cycling \(distance)km.")
//     }
// }

// func commute(distance: Int, using vehicle: Vehicle) {
//     if vehicle.estimateTime(for: distance) > 100 {
//         print("That's too slow! I'll try a different vehicle.")
//     } else {
//         vehicle.travel(distance: distance)
//     }
// }

// func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
//     for vehicle in vehicles {
//         let estimate = vehicle.estimateTime(for: distance)
//         print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
//     }
// }

// let car = Car()
// commute(distance: 100, using: car)

// let bike = Bicycle()
// commute(distance: 50, using: bike)

// getTravelEstimates(using: [car, bike], distance: 150)

// Opaque Return Types

// opaque return types are used when you want to return a value of some type without specifying its exact type in the function signature. Instead of specifying the concrete type, you use the some keyword to indicate that the function returns a value of a specific, consistent type that conforms to a particular protocol.

// ✔️ When you want to hide implementation details but still expose type conformance.
// ✔️ When the return type conforms to a known protocol.
// ✔️ When you want to allow the compiler to maintain type safety while abstracting the concrete type.

// protocol Shape {
//     func draw() -> String
// }

// struct Circle: Shape {
//     func draw() -> String {
//         return "Drawing a circle"
//     }
// }

// struct Square: Shape {
//     func draw() -> String {
//         return "Drawing a square"
//     }
// }

// func makeShape() -> some Shape {
//     return Circle()
// }

// var shape = makeShape()
// print(shape.draw())

// Extensions (Adds new functionality to an existing class, struct, enumeration, or protocol type)
// var quote = "   The truth is rarely pure and never simple   "

// let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

// Same thing as

// extension String {
//     func trimmed() -> String {
//         self.trimmingCharacters(in: .whitespacesAndNewlines)
//     }

//     var boolValue: Bool{
//         if self == "1"{
//             return true
//         } 
//         return false
//     }
// }

// let trimmed = quote.trimmed()
// print(trimmed)

// let boolVal = "0"
// print(boolVal.boolValue)

// Protocol Extension (POP : Protocol Oriented Programming)

// extension Collection {
//     var isNotEmpty: Bool {
//         isEmpty == false
//     }
// }

// let guests = ["Mario", "Luigi", "Peach", "Toad"]

// if guests.isNotEmpty {
//     print("Guest count: \(guests.count)")
// }

// // Person protocol
// protocol Person {
//     var name: String { get }
//     func sayHello()
// }

// // Person extension
// extension Person {
//     func sayHello() {
//         print("Hi, I'm \(name)")
//     }
// }

// // Employee struct
// struct Employee: Person {
//     let name: String
// }

// let taylor = Employee(name: "Taylor Swift")
// taylor.sayHello()

// 1. Protocols are like contracts for code: we specify the functions and methods that we required, and conforming types must implement them.
// 2. Opaque return types let us hide some information in our code. That might mean we want to retain flexibility to change in the future, but also means we don’t need to write out gigantic return types.
// 3. Extensions let us add functionality to our own custom types, or to Swift’s built-in types. This might mean adding a method, but we can also add computed properties.
// 4. Protocol extensions let us add functionality to many types all at once – we can add properties and methods to a protocol, and all conforming types get access to them.

// Checkpoint 8
// make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

// 1. A property storing how many rooms it has.
// 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// 3. A property storing the name of the estate agent responsible for selling the building.
// 4. A method for printing the sales summary of the building, describing what it is along with its other properties.

// protocol Property{
//     var numberOfRooms: Int { get }
//     var cost : Int { get }
//     var estateAgentName : String { get }
//     func printSalesSummary()
// }

// extension Property{
//     func printSalesSummary(){
//         let typeName = String(describing: type(of: self))
//         print("Sales Summary : This \(typeName) has \(numberOfRooms) rooms\n Cost \(cost)\n Agent Name : \(estateAgentName)")
//     }
// }

// struct House: Property{
//     let numberOfRooms: Int 
//     let cost : Int 
//     let estateAgentName : String
// }

// struct Office: Property{
//     let numberOfRooms: Int 
//     let cost : Int 
//     let estateAgentName : String
// }

// var house1 = House(numberOfRooms: 4, cost:100_000, estateAgentName: "Mario")
// var office1 = Office(numberOfRooms: 48, cost:1_200_000, estateAgentName: "Luigi")
// house1.printSalesSummary()
// office1.printSalesSummary()

//------------------------------------------------------------------------

// DAY 14
// Optional Value (?) could have value or nil
// var username: String? = "Testing Optional"
// var username: String? = nil

// if let unwrappedName = username { // Unwrapping optional value
//     print("We got a user: \(unwrappedName)")
// } else {
//     print("The optional was empty.")
// }

// Unwrapping optionals using guard
// var myVar: Int? = 3

// if let unwrapped = myVar {
//     print("Run if myVar has a value inside")
// }

// guard let unwrapped = myVar else {
//     print("Run if myVar doesn't have a value inside")
// }

// func printSquare(of number: Int?) {
//     guard let number = number else {
//         print("Missing input")

//         // 1: We *must* exit the function here
//         return
//     }

//     // 2: `number` is still available outside of `guard`
//     print("\(number) x \(number) is \(number * number)")
// }

// printSquare(of: nil)

// use if let to unwrap optionals so you can process them somehow, and use guard let to ensure optionals have something inside them and exit otherwise.
// You can use guard with any condition, including ones that don’t unwrap optionals. For example, you might use guard someArray.isEmpty else { return }.

// nil coalescing
// let name: String? = nil
// let displayName = name ?? "Guest"
// print(displayName) // Output: Guest

// Optional Chaining (?.)
// You can use optional chaining to safely access properties or methods of an optional value:

// struct Person {
//     var name: String?
// }

// let person = Person(name: "Alice")
// print(person.name?.uppercased()) // Output: Optional("ALICE")

// // let noName = Person(name: nil)
// // print(noName.name?.uppercased()) // Output: nil

// struct Book {
//     let title: String
//     let author: String?
// }

// var book: Book? = nil
// let author = book?.author?.first?.uppercased() ?? "A"
// print(author)

// 1. Optionals let us represent the absence of data, which means we’re able to say “this integer has no value” – that’s different from a fixed number such as 0.
// 2. As a result, everything that isn’t optional definitely has a value inside, even if that’s just an empty string.
// 3. Unwrapping an optional is the process of looking inside a box to see what it contains: if there’s a value inside it’s sent back for use, otherwise there will be nil inside.
// 4. We can use if let to run some code if the optional has a value, or guard let to run some code if the optional doesn’t have a value – but with guard we must always exit the function afterwards.
// 5. The nil coalescing operator, ??, unwraps and returns an optional’s value, or uses a default value instead.
// 6. Optional chaining lets us read an optional inside another optional with a convenient syntax.
// 7. If a function might throw errors, you can convert it into an optional using try? – you’ll either get back the function’s return value, or nil if an error is thrown.

// Checkpoint 9
// write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

// If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.

func randomInt(numbers : [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(randomInt(numbers: nil))
print(randomInt(numbers: [1, 2, 3, 4, 5]))