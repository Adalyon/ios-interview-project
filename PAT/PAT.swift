//
//  PAT.swift
//  PAT
//
//  Created by Tatsuya Kaneko on 20/11/2024.
//

import Foundation

protocol DataSource {
    associatedtype Data
    func fetchData() -> Data
}

final class MockStringDataSource: DataSource {
    func fetchData() -> String {
        return ""
    }
}

struct Person: Decodable {
    let firstName: String
    let lastName: String
}

final class MockPersonDataSource: DataSource {
    func fetchData() -> Person {
        return Person(firstName: "Foo", lastName: "Bar")
    }
}


func processData(source: any DataSource) {
    let data = source.fetchData()
    print(data)
}
