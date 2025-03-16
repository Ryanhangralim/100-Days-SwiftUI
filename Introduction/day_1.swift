import Cocoa

// DAY 1
var greeting = "Hello, playground"

// Constants (let)
let character = "Daphne"

print(character + " Hi")

let movie = """
A day in the 
life of an 
Apple Engineer
"""

// Prints the length of the string
print(movie.count)
// Prints uppercased
print(movie.uppercased())
// Check if the string has a prefix
print(movie.hasPrefix("A"))
// Check if the string has a suffix
print(movie.hasSuffix("dog"))

let numberOfApples: Int = 12
var numberOfOranges: Int = 3

print(numberOfApples + numberOfOranges)

numberOfOranges += 2

print(numberOfApples + numberOfOranges)

print(numberOfApples.isMultiple(of: 2))

//Decimals and numbers
let a = 1
let b = 2.5
let c = Double(a) + b
print(c)