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
struct Player{
    let name: String 
    let number: Int 

    init(name: String){
        self.name = name 
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)