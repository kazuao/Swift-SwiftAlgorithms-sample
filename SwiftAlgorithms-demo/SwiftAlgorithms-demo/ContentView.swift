//
//  ContentView.swift
//  SwiftAlgorithms-demo
//
//  Created by kazunori.aoki on 2021/12/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: onAppear)
    }

    func onAppear() {
        let demo = Demo()
        let demo2 = Demo2()

        demo.combinations()

//        demo.product()
//        demo2.chunked()

//        Benchmark.mesure("サンプル1") {
//            demo2.uniqued()
//        }
//
//        Benchmark.mesure("サンプル2") {
//            demo2.uniqued2()
//        }
    }
}
