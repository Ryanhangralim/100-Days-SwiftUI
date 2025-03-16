import Cocoa 

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

struct Car {
    private(set) var model : String 
    private(set) var numberOfSeats : Int 
    private var currentGear = 1 
    private static let minGear = 1
    private static let maxGear = 10

    init(model: String, numberOfSeats: Int) {
        self.model = model 
        self.numberOfSeats = numberOfSeats
    }

    // current gear getter
    var gear: Int {
        return currentGear
    }

    mutating func addGear() -> String {
        if currentGear < Car.maxGear {
            currentGear += 1
            return "Gear moved to \(currentGear)"
        } else {
            return "Can't change Gear! Gear is on max level: \(currentGear)"
        }
    }

    mutating func subtractGear() -> String {
        if currentGear > Car.minGear {
            currentGear -= 1
            return "Gear moved to \(currentGear)"
        } else {
            return "Can't change Gear! Gear is on min level: \(currentGear)"
        }
    }
}

var Car1 = Car(model: "Model 1", numberOfSeats: 4)
print(Car1.model)
print(Car1.numberOfSeats)
for _ in 1...11{
    print(Car1.addGear())
}
print(Car1.gear)
print(Car1.subtractGear())
print(Car1.gear)