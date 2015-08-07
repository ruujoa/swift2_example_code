//: Playground - noun: a place where people can play

// 模块和源文件
//// nothing to show


// 访问等级
//// public internal private

//// 访问等级的指导原则

//// 默认访问等级

//// 单目标应用程序的访问等级

//// 框架的访问等级

//// 单元测试目标的访问等级


// 访问控制语法
public class SomePublicClass {}
internal class SomeInternalClass {}  // can ignore the access level modifier
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0 // can ignore the access level modifier
private func somePrivateFunction() {}


// 自定义类型
extension SomePublicClass {  //// explicitly public
    public var somePublicProperty: Int { return 0 }  //// explicitly public class member
    var someInternalProperty: Int { return 1000 }  //// implicitly internal class member
    private func somePrivateMethod() {}  //// explicitly private class member
}

extension SomeInternalClass {
    var someInternalProperty: String { return "HELLO" }  //// implicitly internal class member
    private func somePrivateFunction() {}  //// explicitly private class member
}

extension SomePrivateClass {
    var somePrivateProperty: Int { return 100 }  //// implicitly private class member
    func somePrivateMethod() {}  //// implicitly private class member
}

//// 元组类型
//// nothing to show

//// 函数类型

/** Can not be compiled
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    //// function implementation goes here
}*/

private func someFunction() -> (SomeInternalClass, SomePrivateClass)? {
    //// function implementation goes here
    return nil
}

//// 枚举类型
public enum CompassPoint {
    case North
    case South
    case East
    case West
}

//// 原始值和关联值
//// nothing to show

//// 嵌套类型


// 子类化
public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() { super.someMethod() }
}


// 常量、变量、属性和下标
//// Getters和Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct _TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    
    public init() {}
}


// 初始化器
//// nothing to show


// 协议
//// nothing to show


// 扩展
//// nothing to show


// 泛型
//// nothing to show


// 类型别名
//// nothing to show