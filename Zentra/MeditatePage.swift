//
//  MeditatePage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct MeditatePage: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Meditation Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Choose your meditation")
                .foregroundStyle(.white)
                .font(.title2)
            
            VStack(spacing: 20) {
                NavigationLink(destination: playerPage(audioFile: "meditation1", title: "Mindfulness Meditation")) {
                    MeditationOptionButton(title: "Mindfulness Meditation", subtitle: "Mykola Odnoroh-Ikoliks", icon: "brain.head.profile", audioFileName: "meditation1", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation2", title: "Relaxing Background Meditation")) {
                    MeditationOptionButton(title: "Relaxing Meditation", subtitle: "DELOSound", icon: "lungs.fill", audioFileName: "meditation2", useImage: true)
                }
                
                NavigationLink(destination: playerPage(audioFile: "meditation3", title: "Meditation Music")) {
                    MeditationOptionButton(title: "Meditation Music", subtitle: "DanaMusic", icon: "figure.mind.and.body", audioFileName: "meditation3", useImage: true)
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

struct MeditationOptionButton: View {
    let title: String
    let subtitle: String
    let icon: String
    let audioFileName: String
    let useImage: Bool
    
    init(title: String, subtitle: String, icon: String, audioFileName: String = "", useImage: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.audioFileName = audioFileName
        self.useImage = useImage
    }
    
    var body: some View {
        HStack {
            if useImage {
                let imageName = audioFileName + ".jpg"
                
                // Try to load image using Bundle.main.url
                if let imageURL = Bundle.main.url(forResource: audioFileName, withExtension: "jpg"),
                   let imageData = try? Data(contentsOf: imageURL),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    // Fallback to system icon if image loading fails
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 60)
                }
            } else {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .frame(width: 40)
            }
            
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
        .padding(.vertical, 16)
        .padding(.horizontal)
        .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        MeditatePage()
    }
} 
