// Day 4

// Type Annotations
let name: String = "Ryan"
let age: Int = 20
let isStudent: Bool = true
var colors: [String] = ["red", "blue", "green"]
var user: [String: String] = ["name": "Ryan", "email": "ryan@example.com"]
var books: Set<String> = Set(["Harry Potter", "The Alchemist", "To Kill a Mockingbird"])

var stringArray1: [String] = [String]()
var stringArray2: [String] = []
var stringArray3 = [String]()

// Creating constant variable and initialize it later
let username: String
// Complex logic
username = "RyanH"
// lots more Complex logic
print(username)

// Checkpoint 2
let items: [String] = ["item1", "item2", "item3", "item4"]
print("Counts : \(items.count)")
let uniqueItems = Set(items)
print("Unique Item Count: \(uniqueItems.count)")