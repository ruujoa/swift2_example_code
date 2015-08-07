//: Playground - noun: a place where people can play

// 实例方法
class Counter {
    var count = 0
    
    func increment() {
        ++self.count
    }
    
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    func incrementBy(amount: Int, numberOfTimes: Int) {
        self.count += amount * numberOfTimes
    }
    
    func incrementBy(amount: Int, _ numberOfTimes: Int) {
        self.count += amount * numberOfTimes
    }
    
    func reset() {
        self.count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count)
counter.incrementBy(5)
print(counter.count)
counter.reset()
print(counter.count)
counter.incrementBy(5, numberOfTimes: 3)
print(counter.count)
counter.incrementBy(5, 7)
print(counter.count)


// self属性
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

let somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}


// 在实例方法中修改值类型
var anotherPoint = Point(x: 1.0, y: 1.0)
anotherPoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")


// 在可变方法中分配self
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()

// 类型方法
struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}


