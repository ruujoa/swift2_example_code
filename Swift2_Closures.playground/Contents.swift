//: Playground - noun: a place where people can play

// 正常的sort函数
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)

// 闭包表达式语法
reversed = names.sort({ (s1: String, s2:String) -> Bool in
    return s1 > s2
})

// 从上下文推断闭包的参数及返回值类型
reversed = names.sort( { s1, s2 in return s1 > s2 } )

// 从单表达式的闭包隐含地返回
reversed = names.sort( { s1, s2 in s1 > s2 } )

// 简写参数名称
reversed = names.sort( { $0 > $1 } )

// 操作符函数
reversed = names.sort( > )



// 尾随闭包
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //// function body goes here
}

//// here's how you call this function without using a trailing closure
someFunctionThatTakesAClosure({
    //// closure's body goes here
})

//// here's how you call this function with a trailing closure instead
someFunctionThatTakesAClosure() {
    //// trailing closure's body goes here
}

reversed = names.sort { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    
    return output
}

print(strings)


// 捕获值
func makeIncrementer(forIncrement amount: Int) -> Void -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()

// 闭包是引用类型
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

