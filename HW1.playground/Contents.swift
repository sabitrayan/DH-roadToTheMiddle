//1 task
/*
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.

  Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
  Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
  Код [55555].testFunc(count: "5") должен возвращать 5
  Код [55555].testFunc(count: "1") должен возвращать 0.
 */
//import UIKit
//
//var arr:[Int] = [5,15,55,515,555]
//arr.testFunc(x: 5)
//
//
//extension Array {
//    func testFunc(x: Int) {
//        for elem in self{
//            print("\(elem)".components(separatedBy: ("\(x)")).count-1)
//        }
//    }
//}





/**
 2. Отсортировать массив по длине строк его значений

 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 */

//import UIKit
//
//var arr:[String] = ["abc", "ab", "aasdf"]
//print(arr.testSorted())
//
//
//extension Array where Element: Collection {
//    func testSorted() -> [Element] {
//        return self.sorted { $0.count < $1.count }
//    }
//}
//


/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 
 */
//
// var testArray = Array(1...100)
// testArray.remove(at: 25)
// testArray.remove(at: 20)
// testArray.remove(at: 6)
//
// func getMissingNumbers(input array: [Int])-> [Int]{
//     var ans = [Int]()
//     for i in 1..<100 {
//         if !array.contains(i) {
//             ans.append(i)
//         }
//     }
//     return ans
// }
//
// print(getMissingNumbers(input: testArray)) // [7, 21, 26]



/**
 4. Поменять значения массива местами (не использовать reverse)
 */

//var array = [1,2,3]
//
//extension Array{
//    func testReverse() -> [Int]{
//        var ans:[Int] = []
//        for i in 0..<self.count {
//            ans.append(self[self.count-i-1] as! Int)
//        }
//        return ans
//    }
//}
//
//array.testReverse()

/**
 Решите проблему сильных ссылок
 */

class Person {
  let name: String
  let email: String
  var car: Car?

  init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  deinit {
    print("Goodbye \(name)!")
  }
}

class Car {
  let id: Int
  let type: String
  weak var owner: Person?

 init(id: Int, type: String) {
   self.id = id
   self.type = type
 }

 deinit {
   print("Goodbye \(type)!")
 }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil


