//
//  WakeupPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct WakeupPage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Wake Up Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your morning energy")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 20) {
                NavigationLink(destination: playerPage(audioFile: "wakeup1", title: "Forest Sunrise Ambience")) {
                    MeditationOptionButton(title: "Forest Sunrise Ambience", subtitle: "James Carter-Metriko", icon: "sun.horizon", audioFileName: "wakeup1", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "wakeup2", title: "Morning Relaxing")) {
                    MeditationOptionButton(title: "Morning Relaxing", subtitle: "Shakib Hasan-Onetent", icon: "sun.max", audioFileName: "wakeup2", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "wakeup3", title: "Dreamy Slow EDM")) {
                    MeditationOptionButton(title: "Dreamy Slow EDM", subtitle: "AllWorldMusic", icon: "sunrise", audioFileName: "wakeup3", useImage: true)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        WakeupPage()
    }
}

