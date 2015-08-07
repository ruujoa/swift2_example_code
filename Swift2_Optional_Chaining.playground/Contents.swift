//: Playground - noun: a place where people can play

// 可选链作为强制解包的一个替代
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//// let roomCount = john.residence!.numberOfRooms //  force unwrappered: this triggers a runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}


// 为可选链定义模块类
class _Person {
    var residence: _Residence?
}

class _Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}


// 通过可选链访问属性
let smith = _Person()
if let roomCount = smith.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
smith.residence?.address = someAddress //// the attempt to set the address property of smith.residence will fail, because smith.residence is currently nil


// 通过可选链调用方法
if smith.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (smith.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}


// 通过可选链访问下标
if let firstRoomName = smith.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

smith.residence?[0] = Room(name: "Bathroom") //// This subscript setting attempt also fails, because residence is currently nil

let smithのHouse = _Residence()
smithのHouse.rooms.append(Room(name: "Living Room"))
smithのHouse.rooms.append(Room(name: "Kitchen"))
smith.residence = smithのHouse

if let firstRoomName = smith.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}


// 访问可选类型的下标
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72


// 连接多级链
if let smithのStreet = smith.residence?.address?.street {
    print("Smith's street name is \(smithのStreet)")
} else {
    print("Unable to retrieve the address.")
}

let smithのAddress = Address()
smithのAddress.buildingName = "The Larches"
smithのAddress.street = "Laurel Street"
smith.residence!.address = smithのAddress

if let smithのStreet = smith.residence?.address?.street {
    print("Smith's street name is \(smithのStreet)")
} else {
    print("Unable to retrieve the address.")
}


// 链接带可选的返回值的方法
if let buildingIdentifier = smith.residence?.address?.buildingIdentifier() {
    print("Smith's building identifier is \(buildingIdentifier).")
}

if let beginsWithThe = smith.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Smith's building identifier begins with \"The\".")
    } else {
        print("Smith's building identifier does not begin with \"The\".")
    }
}