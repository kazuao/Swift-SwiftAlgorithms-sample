//
//  Demo2.swift
//  SwiftAlgorithms-demo
//
//  Created by kazunori.aoki on 2022/07/12.
//

import Foundation
import Algorithms

final class Demo2 {

    func chunked() {

        struct Member {
            let name: String
            let grade: String
        }

        let results: [Member] = [
            .init(name: "エドワード",   grade: "A"),
            .init(name: "アルフォンス", grade: "A"),
            .init(name: "ウィンリィ",   grade: "B"),
            .init(name: "キング",       grade: "C"),
            .init(name: "エンヴィー",   grade: "C"),
            .init(name: "お父様",       grade: "D")
        ]

        // グループ化できる
        let gradeGroup = results.chunked(on: \.grade)
        for (grade, members) in gradeGroup {
            print("Grade:", grade)

            for member in members {
                print("\t\(member.name)")
            }
        }
    }

    func chunked2() {
        let lists = ["Alphonse", "Edward", "Winry", "Alex", "Envi", "Otosama"].sorted()

        let prefixGroups = lists.chunked(on: \.first!)
        for (id, name) in prefixGroups {
            print("\(id) Group: \(name)")
        }
    }

    func product() {
        let years = 0...5000
        let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let days = 1...31

        for (year, (month, day)) in Algorithms.product(years, Algorithms.product(months, days)) {
            print("\(year)-\(month)-\(day)")
        }
    }

    func product2() {
        let years = 0...5000
        let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let days = 1...31

        for year in years {
            for month in months {
                for day in days {
                    print("\(year)-\(month)-\(day)")
                }
            }
        }
    }

    let randoms = (0...100000).map { _ in Int.random(in: 0...1000) }

    func uniqued() {
        let uniqueNumbers = randoms.uniqued().sorted()

        for number in uniqueNumbers {
            print("\(number)")
        }
    }

    func uniqued2() {
        let set = Array(Set(randoms)).sorted()
        for number in set {
            print("\(number)")
        }
    }
}
