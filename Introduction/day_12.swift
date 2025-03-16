import Cocoa

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

class Animal{
    let legs : Int 
    init(legs: Int){
        self.legs = legs
    }
}

class Dog : Animal{
    func bark() {
        print("Woof Woof mf")
    }

    // init(legs: Int){
    //     super.init(legs: 4)
    // }
}

class Corgi : Dog{
    override func bark(){
        print("Corgi bark")
    }
}

class Poodle : Dog{
    override func bark(){
        print("Poodle bark")
    }
}

class Cat : Animal{
    let isTame: Bool

    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    func meow(){
        print("meow meow mf")
    }
}

class Persian : Cat{
    override func meow(){
        print("Persian meow")
    }
}

class Lion : Cat{
    override func meow(){
        print("Lion meow")
    }
}

var corgi = Corgi(legs: 4)
corgi.bark()
var poodle = Poodle(legs: 4)
poodle.bark()
var persian = Persian(isTame: true,legs: 4)
persian.meow()
var lion = Lion(isTame: false, legs: 4)
lion.meow()
var dog = Dog(legs: 4)
dog.bark()
var cat = Cat(isTame: true, legs: 4)
cat.meow()