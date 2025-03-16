import Cocoa
// DAY 8

// Default Parameter
func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

// Error handling
// Steps
// This takes three steps:

// 1. Telling Swift about the possible errors that can happen.
// 2. Writing a function that can flag up errors if they happen.
// 3. Calling that function, and handling any errors that might happen.

enum PasswordError: Error {
    case short, obvious
}

// throws : indicates that the functin can throw error
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "1234578978798"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// Checkpoint 4
// The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

// 1. You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
// 2. If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
// 3. You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
// 4. If you can’t find the square root, throw a “no root” error.
// As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

enum NumberError: Error{
    case outOfBounds, noRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if number < 1 || number > 10_000{
        throw NumberError.outOfBounds
    } else {
        for i in 1...100{
            if number == i * i{
                return i
            }
        }
        throw NumberError.noRoot
    }
}


func findSquareRoot(_ number: Int) {
    do {
        let result = try squareRoot(number)
        print("Square Root of \(number) is \(result)")
    } catch NumberError.outOfBounds {
        print("Number must be 1 through 10.000")
    } catch NumberError.noRoot {
        print("No root found for number \(number)")
    } catch {
        print("There was an error.")
    }
}

findSquareRoot(2500)