//: Playground - noun: a place where people can play

// 位操作符
//// 按位非操作符
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

//// 按位与操作符
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

//// 按位或操作符
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

//// 按位异或操作符
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

//// 按位左移和右移操作符
//// 无符号整数的位移行为
let shiftBits: UInt8 = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16  // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8  // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF  // blueComponent is 0x99, or 153

//// 有符号整数的位移行为
let positiveFour: Int8 = 0b00000100
let negativeFour: Int8 = -0b0000100


// 溢出操作符
var potentialOverflow = Int16.max
//potentialOverflow += 1  // this causes an error

//// 值溢出
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

unsignedOverflow = UInt8.min
unsignedOverflow = unsignedOverflow &- 1

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1


// 优先级和结合性
let result = 2 + 3 * 4 % 5  // equal to 4, not 0


// 操作符函数
struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

//// 前置和后置操作符
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

//// 组合赋值操作符
func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

prefix func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}

var toIncrement = Vector2D(x: 3.0, y: 3.0)
let afterIncrement = ++toIncrement

//// 相等操作符
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}


// 自定义操作符
prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

//// 自定义中置操作符的优先级和结合性
infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector