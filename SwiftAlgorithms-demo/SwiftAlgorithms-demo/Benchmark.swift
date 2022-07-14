//
//  Benchmark.swift
//  SwiftAlgorithms-demo
//
//  Created by kazunori.aoki on 2022/07/12.
//

import Foundation

final class Benchmark {
    var startTime: Date
    var key: String

    init(key: String) {
        self.startTime = Date()
        self.key = key
    }

    func finish() {
        let elapsed = Date().timeIntervalSince(startTime) as Double
        let formatElapsed = String(format: "%.3f", elapsed)
        print("Benchmark: \(key), Elapsed time: \(formatElapsed)(s)")
    }

    static func mesure(_ key: String, block: () -> Void) {
        let benchmark = Benchmark(key: key)
        block()
        benchmark.finish()
    }
}
