//
//  MeditatePage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI

struct MeditatePage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Meditation Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your meditation")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 15) {
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "Mindfulness Meditation")) {
                    MeditationOptionButton(title: "Mindfulness Meditation", subtitle: "Focus on the present moment", icon: "brain.head.profile")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "Breathing Exercise")) {
                    MeditationOptionButton(title: "Breathing Exercise", subtitle: "Deep breathing techniques", icon: "lungs.fill")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "Body Scan")) {
                    MeditationOptionButton(title: "Body Scan", subtitle: "Progressive relaxation", icon: "figure.mind.and.body")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "Loving Kindness")) {
                    MeditationOptionButton(title: "Loving Kindness", subtitle: "Cultivate compassion", icon: "heart.fill")
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeditationOptionButton: View {
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
        MeditatePage()
    }
} 
