// DAY 2
var gameOver = false
print(gameOver)
gameOver = !gameOver
print(gameOver)
gameOver.toggle( )
print(gameOver)

// String Interpolation
let name = "Daphne"
let age = 25
let greeting2 = "Hello, my name is \(name) and I am \(age) years old."
print(greeting2)
print("Hello, my name is " + name + " and I am " + String(age) + " years old.")

// Checkpoint 1
let celcius = 100
let fahrenheit = (celcius * 9 / 5) + 32
print("Celcius: \(celcius)°C is equal to \(fahrenheit)°F")