//
//  SliderRepresentable.swift
//  SwiftUI + UIKit Game
//
//  Created by Mikhail Bukhrashvili on 12.06.2021.
//

import SwiftUI

struct SliderRepresentable: UIViewRepresentable {
    
    @Binding var value: Int
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumTrackTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.didSlide),
                         for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: CGFloat(alpha)
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderRepresentable(value: .constant(10),
                            alpha: 1)
    }
}

// MARK: - Coordinator
extension SliderRepresentable {
    class Coordinator: NSObject {
        @Binding var value: Int
        
        init(value: Binding<Int>) {
            self._value = value
        }
        
        @objc func didSlide(_ sender: UISlider) {
            value = Int(sender.value)
        }
    }
}
