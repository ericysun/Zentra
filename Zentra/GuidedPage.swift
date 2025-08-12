//
//  GuidedPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct GuidedPage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Guided Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your guided meditation")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 15) {
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "6-Minute Breath Awareness")) {
                    MeditationOptionButton(title: "6-Minute Breath Awareness", subtitle: "Melbourne Mindfulness Centre", icon: "brain.head.profile", audioFileName: "meditation1")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation2", title: "Five Minute Breathing")) {
                    MeditationOptionButton(title: "Five Minute Breathing", subtitle: "UCLA Mindful Awareness Center", icon: "lungs.fill", audioFileName: "meditation2")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation3", title: "The Breathing Space")) {
                    MeditationOptionButton(title: "The Breathing Space", subtitle: "Vidyamala Burch", icon: "figure.mind.and.body", audioFileName: "meditation3")
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GuidedOptionButton: View {
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
        GuidedPage()
    }
}
