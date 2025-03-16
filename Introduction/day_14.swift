import Cocoa

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