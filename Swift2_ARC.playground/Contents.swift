//: Playground - noun: a place where people can play

// ARC实战
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil


// 类实例间的强引用循环
class _Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    var tenant: _Person?
    deinit { print("Apartment #\(number) is being deinitialized") }
}

var john: _Person?
var number73: Apartment?

john = _Person(name: "John")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john

john = nil
number73 = nil


// 解决类实例之间的强引用循环
class __Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    
    var apartment: _Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class _Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: __Person?
    deinit { print("Apartment #\(number) is being deinitialized") }
}

var anne: __Person?
var number68: _Apartment?

anne = __Person(name: "Anne")
number68 = _Apartment(number: 68)

anne!.apartment = number68
number68!.tenant = anne

anne = nil
number68 = nil

// 无主引用
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var mike: Customer?

mike = Customer(name: "Mike")
mike!.card = CreditCard(number: 1234_5678_9012_3456, customer: mike!)

mike = nil


// 无主引用和隐式解包的可选属性
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


// 闭包的强引用循环
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())

paragraph = nil

// 解决闭包的强引用循环
class NewHTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph_2: NewHTMLElement? = NewHTMLElement(name: "p", text: "hello, new world!")
print(paragraph_2!.asHTML())
paragraph_2 = nil

