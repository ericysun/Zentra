//
//  SleepPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct SleepPage: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Sleep Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your sleep aid")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 20) {
                NavigationLink(destination: playerPage(audioFile: "sleep1", title: "Peaceful Sleep")) {
                    MeditationOptionButton(title: "Peaceful Sleep", subtitle: "Zakhar Valah-Good_B_Music", icon: "bed.double", audioFileName: "sleep1", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "sleep2", title: "Calming Ambience")) {
                    MeditationOptionButton(title: "Calming Ambience", subtitle: "Allicante", icon: "moon.stars", audioFileName: "sleep2", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "sleep3", title: "Healing Sleep Atmosphere")) {
                    MeditationOptionButton(title: "Healing Sleep Atmosphere", subtitle: "Allicante", icon: "cloud.moon", audioFileName: "sleep3", useImage: true)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                        Text("Back")
                            .font(.body)
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SleepPage()
    }
}

