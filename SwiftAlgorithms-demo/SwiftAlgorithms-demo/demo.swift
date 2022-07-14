//
//  demo.swift
//  SwiftAlgorithms-demo
//
//  Created by kazunori.aoki on 2021/12/14.
//

import Foundation
import Algorithms

class Demo {

    func combinations() {
        let numbers = [10, 20, 30, 40]
        for combo in numbers.combinations(ofCount: 2...3) {
            print(combo)
        }
    }

//    func product() {
//        let months = ["January", "February", "March", "April"]
//        let days = 1...31
//        for (year, (month, day)) in  Algorithms.product(1900...2022, Algorithms.product(months, days)) {
//            print("\(year)-\(month)-\(day)")
//        }
////        for (year, season) in Algorithms.product(1900...2022, seasons) {
////            print("\(year): \(season)")
////        }
//    }

    /* chain */
    func chain() {

        let name1 = ["Jane", "Elizabeth", "Mary", "Kitty"]
        let name2 = ["Daphne", "Eloise", "Francesca", "Hyacinth"]

        //for name in name1 + name2 {
        //    print(name)
        //}
        // 上と同じ効果がある
        // くっつけられる
        for name in Algorithms.chain(name1, name2) {
            print(name)
        }
    }


    /* chunks */
    func chunk() {

        struct Student {
            let name: String
            let grade: String
        }

        let results = [
            Student(name: "Taylor", grade: "A"),
            Student(name: "Sophie", grade: "A"),
            Student(name: "Bella", grade: "B"),
            Student(name: "Rajesh", grade: "C"),
            Student(name: "Tony", grade: "C"),
            Student(name: "Theresa", grade: "D"),
            Student(name: "Boris", grade: "F")
        ]

        // グループ化できる
        let studentsByGrade = results.chunked(on: \.grade)
        for (grade, students) in studentsByGrade {
            print("Grade:", grade)

            for student in students {
                print("\t\(student.name)")
            }

            print() // 改行
        }

        //let studentsByName = results.sorted { $0.name < $1.name }.chunked(on: \.name.first!)
        //for (firstLetter, students) in studentsByName {
        //    print(firstLetter)
        //
        //    for student in students {
        //        print("\t\(student.name)")
        //    }
        //
        //    print()
        //}

        let pairs = results.chunks(ofCount: 2)

        // 上から2人ずつ表示される（Taylor and Sophia）
        for pair in pairs {
            // 上から2人ずつ表示される（Taylor and Sophia）
        //    let names = ListFormatter.localizedString(byJoining: pairs.map(\.name))
        //    print(names)
        }
    }

    // randomで重複しない値を取得する
    func randomSample() {
        let lotteryBalls = 1...50
        let winningNumbers = lotteryBalls.randomSample(count: 7 )
        print(winningNumbers) //randomで7つの数字を取り出す
    }

    // itemの順序が保持される
    func randomStableSample() {
        let people = ["Chidi", "Eleanor", "Jason", "Tahani"]
        let selected = people.randomStableSample(count: 2)
        print(selected)
    }

    // シーケンスをまたぐ（簡単に奇数のみの配列が作れる）
    func striding() {
        let numbers = 1...1000

//        let oddNumbers = numbers.striding(by: 2) // 奇数行のものを取得
        // 上記と同じ
        let oddNumbers = stride(from: numbers.lowerBound, through: numbers.upperBound, by: 2)

        for oddNumber in oddNumbers {
            print(oddNumber)
        }

        let inputString = "a1b2c3d4e5" // 奇数を取り出しているわけではない
        let letters = inputString.striding(by: 2)

        for letter in letters {
            print(letter)
        }
    }

    // uniqueな値のみ取り出せる
    func uniqued() {
        let randoms = (0...1000).map { _ in Int.random(in: 0...1000) }
//        let allNumbers = [3, 7, 8, 8, 7, 67, 8, 7, 13, 8, 3, 7, 31]
        let set = Array(Set(randoms)).sorted()

        let uniqueNumbers = randoms.uniqued().sorted()

//        for number in uniqueNumbers {
//            print("\(number) is a lucky number")
//        }

        for number in set {
            print("\(number) is a lucky number")
        }
    }

    func uniquedOn() {
        struct City {
            let name: String
            let country: String
        }

        let destinations = [
            City(name: "Hamburg", country: "Germany"),
            City(name: "Kyoto", country: "Japan"),
            City(name: "Osaka", country: "Japan"),
            City(name: "Naples", country: "Italy"),
            City(name: "Florence", country: "Italy"),
        ]

        // 同じuniquedでも、国ごとにまとめて、１番最初にあるものを出力する
        let selectedCities = destinations.uniqued(on: \.country)

        for city in selectedCities {
            print("Visit \(city.name) in \(city.country)")
        }
    }

    func compacted() {
        let numbers = [10, nil, 20, nil, 30]
//        let safeNumbers = numbers.compactMap { $0 }
        // よりシンプルに
        let safeNumbers = numbers.compacted()

        print(safeNumbers.count)
    }

    // すべての組み合わせを作成する
//    func product() {
//        let people = ["Sophie", "Charlotte", "Maddie", "Sennen"]
//        let games = ["Mario Kart", "Boomerang Fu"]
//
//        let allOptions = Algorithms.product(people, games)
//
//        for option in allOptions {
//            print("\(option.0) will play \(option.1)")
//        }
//
//        // 20このrandomな問題を絵sん宅
//        let range = 1...12
//        let questionCount = 20
//        let allMultiples = Algorithms.product(range, range).randomSample(count: questionCount)
//
//        for pair in allMultiples {
//            print("\(pair.0) x \(pair.1) is \(pair.0 * pair.1)")
//        }
//
//        // ネストもできる
//        let suspects = ["Colonel Mustard", "Professor Plum", "Mrs White"]
//        let locations = ["kitchen", "library", "study", "hall"]
//        let weapons = ["candlestick", "dagger", "lead pipe", "rope"]
//        let guesses = Algorithms.product(Algorithms.product(suspects, locations), weapons)
//
//        for guess in guesses {
//            print("Was it \(guess.0.0) in the \(guess.0.1) with the \(guess.1)?")
//        }
//    }

    // シーケンスのスライド
    func adjacentPairs() {
        let numbers = (1...100).adjacentPairs()

        for pair in numbers {
            print("Pair: \(pair.0) and \(pair.1)")
        }

        // groupを作れる
        let numbers2 = (1...100).windows(ofCount: 5)

        for group in numbers2 {
            let strings = group.map(String.init)
            print(ListFormatter.localizedString(byJoining: strings))
        }
    }

    // mi
    func minAndMax() {
        let names = ["John", "Paul", "George", "Ringo"]

        // 最大値と最小値を主力する
        if let (first, last) = names.minAndMax() {
            print(first)
            print(last)
        }

        // 最小から数えた数を出力する
        let scores = [42, 4, 23, 8, 16, 15]
        let threeLowest = scores.min(count: 3)
        print(threeLowest)
    }
}
