// DAY 3
var characters : [String] = ["Billy Summers", "Alice Maxwell", "Jake Epping", "Saddie Dunhill"]
characters.append("Harry Dunning")
print(characters)
characters.remove(at: 3)
print(characters)

var numbers = Array<Int>(repeating: 0, count: 10)
print(numbers)
var numbers2 = [Int](repeating: 0, count:10)
print(numbers2)
numbers2.removeAll()
print(numbers2.count)

print(characters.contains("Paul"))
print(characters.sorted())
print(characters.reversed())
print(characters.joined(separator: ", "))
print("sorted".reversed())

let book = [
   "title" : "11/22/63",
   "pages" : "384",
   "author" : "Stephen King",
   "genre" : "Time Travel",
   "publish_date" : "1982-07-01"
]

print("Book Information: Title: \(book["title"] ?? "Unknown"), Author: \(book["author"] ?? "Unknown"), Genre: \(book["genre", default: "Unknown"])")
print(book["age", default: "Unknown"])

// Create empty dictionary using explicit types
var heights = [String: Int]()
heights["Alice"] = 160
heights["Bob"] = 170

print(heights)

var heights2: [String: Int] = [:]
heights2["Alice"] = 160
heights2["Bob"] = 170
print(heights2)

heights["Alice"] = 165
print(heights)

// Sets
let books = Set(["Billy Summers", "The Silent Patient", "11/22/63", "Five Survive"])
print(books)

var books2 = Set<String>()
books2.insert("Billy Summers")
books2.insert("The Silent Patient")
books2.insert("11/22/63")
books2.insert("Five Survive")
print(books2)

// Enumeration
enum Weekday {
   case monday
   case tuesday
   case wednesday
   case thursday
   case friday
}

enum Weekday2 {
   case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
print(day)
day = Weekday.tuesday
print(day)
day = .friday
print(day)