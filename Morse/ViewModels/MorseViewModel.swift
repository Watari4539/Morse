//
//  MorseViewModel.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import SwiftUI

class MorseViewModel: ObservableObject {
    @Published var currentSequence: String = ""
    @Published var isPressing: Bool = false
    
    private let toneGenerator = ToneGenerator()
    private var pressStartTime: Date?
    private var resetTimer: Timer?
    
    func buttonPressed() {
        
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()
        resetTimer?.invalidate()
        
        // Sonido instantáneo
        toneGenerator.start()
        isPressing = true
        pressStartTime = Date()
    }
    
    func buttonReleased() {
        toneGenerator.stop()
        isPressing = false
        
        guard let startTime = pressStartTime else { return }
        let duration = Date().timeIntervalSince(startTime)
        
        // LOGICA DE PRECISIoN:
        // Si el toque duró menos de 0.18s es un punto.
        // Si duró más, es una raya.
        if duration < 0.18 {
            currentSequence += "."
        } else {
            currentSequence += "-"
        }
        
        // Reiniciar la posición si no hay actividad en 1.2 segundos
        startResetTimer()
    }
    
    private func startResetTimer() {
        resetTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            DispatchQueue.main.async {
                self.currentSequence = ""
            }
        }
    }
}
