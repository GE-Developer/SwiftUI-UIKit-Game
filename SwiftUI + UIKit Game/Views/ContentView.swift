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
    private var alpha: Double {
        Double(computeScore()) / 100
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к: ")
                    .bold()
                Text("\(targetValue)")
                    .foregroundColor(.blue)
                    .italic()
                    .bold()
                    .frame(width: 40, alignment: .leading)
            }
            .padding()
            
            SliderRepresentable(value: $currentValue,
                                alpha: alpha)                .padding(.horizontal)
            
            Button("Проверь меня!") {
                alertIsPresented.toggle()
            }
            .alert(isPresented: $alertIsPresented) {
                Alert(title: Text("Your score"),
                      message: Text("\(computeScore())"),
                      dismissButton: .cancel(Text("OK")))
            }
            .padding()
            
            ResetButton(currentValue: $currentValue,
                        targetValue: $targetValue)
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

// MARK: - Reset Button
struct ResetButton: View {
    @Binding var currentValue: Int
    @Binding var targetValue: Int
    var body: some View {
        Button("Начать заново!") {
            currentValue = 10
            targetValue = Int.random(in: 0...100)
        }
    }
}
