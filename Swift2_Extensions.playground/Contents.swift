//: Playground - noun: a place where people can play

// 扩展计算属性
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")


// 扩展初始化器
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point(x: originX, y: originY),
            size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))


// 扩展方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

var sayHello = {
   print("Hello!")
}

3.repetitions(sayHello)
3.repetitions { print("Goodbye!") }

//// 扩展可变实例方法
extension Int {
    mutating func square() {
        self *= self
    }
}

var someInt = 3
someInt.square()


// 扩展下标
extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        
        return (self / decimalBase) % 10
    }
}

857142[1]
857142[4]
857142[0]
857142[10]
857142[-2]


// 扩展嵌套类型
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}

func printIntegerKinds(numbers: Int...) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ", appendNewline: false)
        case .Zero:
            print("0 ", appendNewline: false)
        case .Positive:
            print("+ ", appendNewline: false)
        }
    }
    
    print("")
}

printIntegerKinds(0, 0, 0, 0, 0)
printIntegerKinds(2, 3, 5, 7, 11)
printIntegerKinds(-2, -4, -8, -16)
