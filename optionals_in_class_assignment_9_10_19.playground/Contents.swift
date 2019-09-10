// This is a function that returns a String? (or Optional<String>). You'll use it below.
func getFirstVowel(in name: String) -> String? {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "y"]
    for char in name {
        if vowels.contains(char) {
            return String(char)
        }
    }
    return nil
}

// TODO: Change yourName to your name.
let yourName = "Ethan"

let firstVowel = getFirstVowel(in: yourName)

// TODO: Assign the underlying value of firstVowel to unwrappedVowelOne, unwrappedVowelTwo, and unwrappedVowelThree. Use a different method of unwrapping firstVowel each time.
// v-- Insert code below here --v
var unwrappedVowelOne: String = firstVowel!

var unwrappedVowelTwo: String = (getFirstVowel(in: yourName) ?? "Ethan")

var unwrappedVowelThree: String
if let unwrappedVowelThree = firstVowel {
    print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")
} else {
    unwrappedVowelThree = "No vowels"
}

// ^-- Insert code above here --^
print("The first vowel in '\(yourName)' is '\(String(describing: unwrappedVowelOne))'.")
print("The first vowel in '\(yourName)' is '\(String(describing: unwrappedVowelTwo))'.")
//print("The first vowel in '\(yourName)' is '\(unwrappedVowelThree)'.")
