import UIKit

// Task 1
var number = 1
var result = 1
while number < 20 {
    result *= number
    number += 2
}
print(result)

//Task 2
var name: String = "Test"
var reverseName = ""
for character in name {
    reverseName = String(character) + reverseName
}
print(reverseName)

//Task 3
var color = "🔴"
var count = 0
while true {
    if count > 54 { break }
    switch color {
    case "🔴" :
        print("🔴->", terminator: "")
        color = "🟡"
    case "🟡":
        print("🟡->", terminator: "")
        color = "🟢"
    case "🟢":
        print("🟢->", terminator: "")
        color = "🔴"
    default:
        break
    }
    count += 1
}
print("\n")

//Task 4
var tickets = 20

while tickets > 0 {
    tickets -= 1
    print("ბილეთი გაყიდულია. დარჩენილია მხოლოდ \(tickets) ბილეთი")
    if tickets == 0 {
        print("ყველა ბილეთი გაყიდულია, გელოდებით კონცერტზე")
    }
}

//Task 5
let numbersArray = [1, 2, 3, 4, 5, 1]
var different = Set(numbersArray)
if different.count == numbersArray.count {
    print("array-ში ყველა ელემენტი განსხვავებულია")
} else {
    print("array შეიცავს მსგავს ელემენტებს")
}

//Task 6
let myClosure: (Double, Double) -> Double = {x, y in
    return x - y
}
print(myClosure(50, 30))

//Task 7
func numberOfConsonants(word:String) -> () {
    let vowels: [Character] = ["ა", "ე", "ი", "ო", "უ"]
    var consonants = 0
    for vowel in word {
        if vowels.contains(vowel) {
            continue
        }
        consonants += 1
    }
    print("თანხმოვნების რაოდენობა არის \(consonants)")
}
numberOfConsonants(word: "კომპიუტერი")

