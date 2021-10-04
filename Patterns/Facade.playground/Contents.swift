import UIKit

protocol ClientType: class {
    func makeOrder(for food: Food)
    func sendPayment()
}

protocol ShefType: class {
    func startCooking()
}

class Food {
    let title: String
    let description: String
    var price: Int?

    init(title: String, description: String,price: Int) {
        self.title = title
        self.description = description
        self.price = price
    }
}


class Client: ClientType {
    func makeOrder(for food: Food) {
        //
    }

    let name: String

    init(name: String) {
        self.name = name
    }

    func sendPayment() {
        // Client sends payment to a company
    }
}

class Shef: ShefType {
    let name: String
    let food: Food

    init(name: String, food: Food) {
        self.name = name
        self.food = food
    }

    func startCooking() {
        // Developer starts working on the project
    }
}


class OrderFacade {
    let client: Client
    let shef: Shef

    init(client: Client, shef: Shef) {

        self.client = client
        self.shef = shef
    }

    public func placeOrder(food: Food) {
        client.makeOrder(for: food)
        client.sendPayment()

        shef.startCooking()
    }
}

let client = Client(name: "Lev")
let food = Food(title: "Beshbarmak", description: "More meat", price: 1000)
let shef = Shef(name: "Ryan", food: food)
let orderFacade = OrderFacade(client: client,shef: shef)
orderFacade.placeOrder(food: food)
