//
//  MainContentView.swift
//  Morse
//
//  Created by Adrián Nieto on 20/04/26.
//

import SwiftUI

struct MainContentView: View {
    @StateObject private var viewModel = MorseViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.12, blue: 0.12).ignoresSafeArea()
            
            VStack(spacing: 0) {
                TreeMapView(currentSequence: viewModel.currentSequence, isPressing: viewModel.isPressing)
                    .padding(.top, 20)
                    .layoutPriority(1)
                
                Spacer(minLength: 20)
                
                TelegraphButtonView(viewModel: viewModel)
                    .padding(.bottom, 40)
            }
            .padding(.horizontal)
        }
    }
}
