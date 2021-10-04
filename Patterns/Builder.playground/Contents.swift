import UIKit

enum Type {
    case gaz
    case oil
}

class Car {
    var type: Type?
    var consumption: Int?
}

class carBuilder {
    let car = Car()
    func onType(_ type: Type) {
        self.car.type = type
    }

    func onConsumption(_ consumption: Int) {
        self.car.consumption = consumption
    }

    func build() -> Car {
        return self.car
    }
}

class carsFactory {
    func createGibrid(with builder: carBuilder) -> Car {
        builder.onType(.oil)
        builder.onConsumption(250)
        return builder.build()
    }
}

let factory = carsFactory()
let builder = carBuilder()
let s500 = factory.createGibrid(with: builder)
