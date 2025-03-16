import Cocoa
// DAY 7

// Functions
func printTimesTables(number: Int, end: Int) -> Int{
    var total = 0 
    for i in 1...end{
        print("\(i) X \(number) is \(i * number)")
        total += (i * number)
    }
    return total
}

print("Result: " + String(printTimesTables(number: 5, end: 10)))


func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

print("Result: " + String(pythagoras(a: 3, b: 4)))
// Re`turning multiple values (tuple)
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, lastName) = getUser()
print("Name: \(firstName) \(lastName)")

let user = getUser()
print("Name: \(user.0) \(user.1)")

// _ omits parameter
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)
print(result)

// replace parameter name
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)