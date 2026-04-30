//
//  ContentView.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MorseViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.15, blue: 0.15)
                .ignoresSafeArea()
            
            VStack {
                Text("CM")
                    .font(.system(size: 24, weight: .black, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                TreeMapView(currentSequence: viewModel.currentSequence, isPressing: viewModel.isPressing)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                
                TelegraphButtonView(viewModel: viewModel)
                    .padding(.bottom, 60)
            }
        }
        .colorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
