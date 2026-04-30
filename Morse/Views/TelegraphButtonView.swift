//
//  TelegraphButtonView.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import SwiftUI

struct TelegraphButtonView: View {
    @ObservedObject var viewModel: MorseViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                Circle()
                    .fill(viewModel.isPressing ? Color.green.opacity(0.3) : Color.black)
                    .frame(width: 140, height: 140)
                    .overlay(
                        Circle()
                            .stroke(viewModel.isPressing ? Color.green : Color.white, lineWidth: 6)
                            .scaleEffect(viewModel.isPressing ? 1.1 : 1.0)
                    )
                
                Text(viewModel.isPressing ? "" : "TAP")
                    .font(.system(size: 28, weight: .black, design: .monospaced))
                    .foregroundColor(.white)
            }
            .contentShape(Circle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        if !viewModel.isPressing {
                            viewModel.buttonPressed()
                        }
                    }
                    .onEnded { _ in
                        viewModel.buttonReleased()
                    }
            )
            .animation(.spring(response: 0.2, dampingFraction: 0.5), value: viewModel.isPressing)
            
            Text(viewModel.currentSequence)
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
                .tracking(5)
                .frame(height: 40)
        }
    }
}
