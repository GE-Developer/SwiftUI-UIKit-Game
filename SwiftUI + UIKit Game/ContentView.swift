//
//  ContentView.swift
//  SwiftUI + UIKit Game
//
//  Created by Mikhail Bukhrashvili on 12.06.2021.
//

import SwiftUI

struct ContentView: View {

    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 10
    @State private var alertIsPresented = false
    
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                .padding()
            
            SliderRepresentable(value: $currentValue,
                                alpha: Float(computeScore()))
                .padding(.horizontal)
            
            Button("Проверь меня!") {
                self.alertIsPresented.toggle()
            }
            .alert(isPresented: $alertIsPresented) {
                Alert(title: Text("Your score"),
                      message: Text("\(computeScore())"),
                      dismissButton: .cancel(Text("OK")))
            }
            
            Button("Начать заново!") {
                currentValue = 10
                targetValue = Int.random(in: 0...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
