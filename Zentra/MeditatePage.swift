//
//  MeditatePage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

// Function to get audio duration
func getAudioDuration(fileName: String) -> String {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
        return "0 min"
    }
    
    let url = URL(fileURLWithPath: path)
    let asset = AVAsset(url: url)
    let duration = asset.duration
    let durationInSeconds = CMTimeGetSeconds(duration)
    let minutes = Int(durationInSeconds / 60)
    
    return "\(minutes) min"
}

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
                    MeditationOptionButton(title: "Mindfulness Meditation", subtitle: "Focus on the present moment", icon: "brain.head.profile", audioFileName: "meditation1")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation2", title: "Breathing Exercise")) {
                    MeditationOptionButton(title: "Breathing Exercise", subtitle: "Deep breathing techniques", icon: "lungs.fill", audioFileName: "meditation2")
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation3", title: "Body Scan")) {
                    MeditationOptionButton(title: "Body Scan", subtitle: "Progressive relaxation", icon: "figure.mind.and.body", audioFileName: "meditation3")
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
    let audioFileName: String
    
    init(title: String, subtitle: String, icon: String, audioFileName: String = "") {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.audioFileName = audioFileName
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Spacer()
                    if !audioFileName.isEmpty {
                        Text(getAudioDuration(fileName: audioFileName))
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.9))
                            .fontWeight(.medium)
                    }
                }
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
