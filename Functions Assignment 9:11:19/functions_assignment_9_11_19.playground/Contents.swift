//This function squares numbers
func square(number: Int) -> Int {
    let squared = number * number
    return(squared)
}
print(square(number: 18))

//This function just returns/prints 5
func five() -> Int {
    return 5
}
print(five())

//This number takes two strings and prints them together
func fullName(first: String, last: String) -> String{
    return first + " " + last
}
print(fullName( first: "Ethan", last: "Weinrot"))

//This function takes a string and puts an exclamation point after it
func shout(input: String) -> String {
    return input + "!"
}
print(shout(input: "YO"))

//This function turns an int into a string. If the number is greater than 9, the function returns "nil"
func numberName(numbers: Int) -> String? {
    let letters = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    if numbers <= 9 {
    return letters[numbers]
}
    else {
        return nil
    }
}
print(numberName(numbers: 7)!)

