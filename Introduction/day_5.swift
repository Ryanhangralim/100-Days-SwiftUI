// DAY 5
var username = ""

if username.isEmpty {
    username = "Anonymous"
}

print("Welcome \(username)")

// If else
enum Transports {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = Transports.car 

if transport == .airplane || transport == .helicopter {
    print("Let's Fly!")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}

// Switch
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
default:
    print("We'll have to see")
}

let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary operator
let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

enum Theme {
    case light, dark
}

let theme = Theme.dark 

let background = theme == .dark ? "black" : "white"
print(background)