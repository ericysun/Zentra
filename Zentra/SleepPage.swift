//
//  SleepPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct SleepPage: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Sleep Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your sleep aid")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 15) {
                NavigationLink(destination: playerPage(audioFile: "sleep1", title: "Peaceful Sleep")) {
                    MeditationOptionButton(title: "Peaceful Sleep", subtitle: "Zakhar Valah-Good_B_Music", icon: "bed.double", audioFileName: "sleep1")
                }
                
                NavigationLink(destination: playerPage(audioFile: "sleep2", title: "Calming Ambience")) {
                    MeditationOptionButton(title: "Calming Ambience", subtitle: "Allicante", icon: "moon.stars", audioFileName: "sleep2")
                }
                
                NavigationLink(destination: playerPage(audioFile: "sleep3", title: "Healing Sleep Atmosphere")) {
                    MeditationOptionButton(title: "Healing Sleep Atmosphere", subtitle: "Allicante", icon: "cloud.moon", audioFileName: "sleep3")
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SleepOptionButton: View {
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
        SleepPage()
    }
}

