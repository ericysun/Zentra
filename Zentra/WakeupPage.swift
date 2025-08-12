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
            
            VStack(spacing: 15) {
                NavigationLink(destination: playerPage(audioFile: "wakeup1", title: "Morning Energy")) {
                    MeditationOptionButton(title: "Morning Energy", subtitle: "Start your day with vitality", icon: "sun.horizon", audioFileName: "wakeup1")
                }
                
                NavigationLink(destination: playerPage(audioFile: "wakeup2", title: "Rise and Shine")) {
                    MeditationOptionButton(title: "Rise and Shine", subtitle: "Energizing morning sounds", icon: "sun.max", audioFileName: "wakeup2")
                }
                
                NavigationLink(destination: playerPage(audioFile: "wakeup3", title: "Dawn Awakening")) {
                    MeditationOptionButton(title: "Dawn Awakening", subtitle: "Gentle morning meditation", icon: "sunrise", audioFileName: "wakeup3")
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WakeupOptionButton: View {
    let title: String
    let subtitle: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding()
        .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        WakeupPage()
    }
}

