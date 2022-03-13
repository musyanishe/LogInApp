//
//  Person.swift
//  LogInApp
//
//  Created by Евгения Шевцова on 12.03.2022.
//

import Foundation

struct User {
    let user: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            user: "Alexey",
            password: "Welcome",
            person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let image: String
    
    static func getPerson() -> Person {
        Person(name: "Evgeniia Shevtsova", image: "photo")
    }
}
