//: Playground - noun: a place where people can play

// 字符串字面量中的特殊字符
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55c}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

// 访问和修改字符串
let greeting = "Guten Tag"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = advance(greeting.startIndex, 7)
greeting[index]
//greeting[greeting.endIndex] // error
//greeting.endIndex.successor() // runtime error

for index in greeting.characters.indices {
    print("\(greeting[index]) ", appendNewline: false)
}
print("\n")

var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.splice(" there".characters, atIndex: welcome.endIndex.predecessor())

welcome.removeAtIndex(welcome.endIndex.predecessor())
let range = advance(welcome.endIndex, -6)..<welcome.endIndex
welcome.removeRange(range)

// 字符串比较
let eAcuteAQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteAQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
