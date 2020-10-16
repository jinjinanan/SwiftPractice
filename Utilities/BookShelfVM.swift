//
//  BookShelfVM.swift
//  Practice
//
//  Created by admin on 2020/10/12.
//

import Foundation
import RealmSwift

class Dog: Object {
    @objc dynamic var name = "a"
    @objc dynamic var age = 0
}

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
}

let myDog = Dog()

let realm = try! Realm()

func p()  {
    
    let pupies = realm.objects(Dog.self).filter("age < 2")
    DLog("小狗数量 \(pupies.count)")
    
    myDog.name = "rex"
    myDog.age = 1
    
    try! realm.write({
        realm.add(myDog)
    })
    DLog("小狗数量 \(pupies.count)")
    
    // Query and update from any thread
    DispatchQueue.init(label: "backgournd").async {
        autoreleasepool {
            let realm = try! Realm()
            let theDog = realm.objects(Dog.self).filter("age == 1").first
            try! realm.write {
                theDog!.age = 3
            }
            let apupies = realm.objects(Dog.self).filter("age < 2")
            DLog("小狗数量 \(apupies.count)")
        }
    }
}
