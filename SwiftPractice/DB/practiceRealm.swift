//
//  practiceRealm.swift
//  Practice
//
//  Created by admin on 2020/10/17.
//

import Foundation
import RealmSwift

let realm = try! Realm()

func setDefaultRealmForUser(username: String) {
    var config = Realm.Configuration()

    // Use the default directory, but replace the filename with the username
    config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")

    // Set this as the configuration used for the default Realm
    Realm.Configuration.defaultConfiguration = config
}



//class Dog: Object {
//    @objc dynamic var name = "a"
//    @objc dynamic var age = 0
//}
//
//class Person: Object {
//    @objc dynamic var name = ""
//    @objc dynamic var picture: Data? = nil // optionals supported
//    let age = RealmOptional<Int>()
//    let dogs = List<Dog>()
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//}
//
//let myDog = Dog()
//
//
//
//func p() {
//    try! realm.write() {
//        var person = realm.create(Person.self,value: ["jane",nil,27])
//    }
//}
//
//func d()  {
//    
//    let pupies = realm.objects(Dog.self).filter("age < 2")
//    DLog("小狗数量 \(pupies.count)")
//    
//    myDog.name = "rex"
//    myDog.age = 1
//    
//    try! realm.write({
//        realm.add(myDog)
//    })
//    DLog("小狗数量 \(pupies.count)")
//    
//    // Query and update from any thread
//    DispatchQueue.init(label: "backgournd").async {
//        autoreleasepool {
//            let realm = try! Realm()
//            let theDog = realm.objects(Dog.self).filter("age == 1").first
//            try! realm.write {
//                theDog!.age = 3
//            }
//            let apupies = realm.objects(Dog.self).filter("age < 2")
//            DLog("小狗数量 \(apupies.count)")
//        }
//    }
//}
