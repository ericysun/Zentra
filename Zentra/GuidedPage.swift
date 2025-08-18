//
//  GuidedPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct GuidedPage: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Guided Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your guided meditation")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 20) {
                NavigationLink(destination: playerPage(audioFile: "guided1", title: "6-Minute Breath Awareness")) {
                    MeditationOptionButton(title: "6-Minute Breath Awareness", subtitle: "Melbourne Mindfulness Centre", icon: "brain.head.profile", audioFileName: "guided1", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "guided2", title: "Five Minute Breathing")) {
                    MeditationOptionButton(title: "Five Minute Breathing", subtitle: "UCLA Mindful Awareness Center", icon: "lungs.fill", audioFileName: "guided2", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "guided3", title: "The Breathing Space")) {
                    MeditationOptionButton(title: "The Breathing Space", subtitle: "Vidyamala Burch", icon: "figure.mind.and.body", audioFileName: "guided3", useImage: true)
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
        GuidedPage()
    }
}
