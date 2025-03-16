import Cocoa

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

protocol Property{
    var numberOfRooms: Int { get }
    var cost : Int { get }
    var estateAgentName : String { get }
    func printSalesSummary()
}

extension Property{
    func printSalesSummary(){
        let typeName = String(describing: type(of: self))
        print("Sales Summary : This \(typeName) has \(numberOfRooms) rooms\n Cost \(cost)\n Agent Name : \(estateAgentName)")
    }
}

struct House: Property{
    let numberOfRooms: Int 
    let cost : Int 
    let estateAgentName : String
}

struct Office: Property{
    let numberOfRooms: Int 
    let cost : Int 
    let estateAgentName : String
}

var house1 = House(numberOfRooms: 4, cost:100_000, estateAgentName: "Mario")
var office1 = Office(numberOfRooms: 48, cost:1_200_000, estateAgentName: "Luigi")
house1.printSalesSummary()
office1.printSalesSummary()