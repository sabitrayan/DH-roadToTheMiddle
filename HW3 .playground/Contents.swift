import UIKit

/*
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */

protocol Profile {
    func getName()
}

protocol Address {
    func getAddress()
}

protocol ManagerProtocol {
    associatedtype SourceType
}

class Manager {
    typealias profile = Profile
    typealias address = Address
    var name,address: String
    init(name: String,address: String) {
        self.name = name
        self.address = address
    }
}

extension Manager: Profile {
    func getName() {
        print(self.name)
    }
    func getAddress(){
        print(self.address)
    }
}

var x = Manager(name: "Ryan", address: "Almaty")
x.getAddress()

/*
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.

 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его
 */

protocol RequestManager {
    associatedtype SourceType
    func get(with source: SourceType)
}


class NetworkManager {
    var requestManager: AnyRequestManager<RequestDict>!
    let source = ["Ryan": "Sabit"]

    func getAllData() {
        requestManager.get(with: source)
    }
}
typealias RequestDict = [AnyHashable: Any]

private class _AnyRequestManagerBox<SourceType>: RequestManager {
    func get(with source: SourceType) {
        fatalError("This method is abstract")
    }
}

private class _RequestManagerBox<Base: RequestManager>: _AnyRequestManagerBox<Base.SourceType> {
    private let _base: Base
    init(_ base: Base) {
        _base = base
    }

    override func get(with source: Base.SourceType) {
        _base.get(with: source)
    }
}

struct AnyRequestManager<SourceType>: RequestManager {
    private let _box: _AnyRequestManagerBox<SourceType>

    init<RequestManagerType: RequestManager>(_ requestManager: RequestManagerType) where RequestManagerType.SourceType == SourceType {
        _box = _RequestManagerBox(requestManager)
    }

    func get(with source: SourceType) {
        _box.get(with: source)
    }
}

var manager = NetworkManager()
manager.getAllData()
