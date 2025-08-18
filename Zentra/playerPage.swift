//
//  playerPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import AVFoundation

struct playerPage: View {
    let audioFile: String
    let title: String
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 40) {
                if let imageURL = Bundle.main.url(forResource: audioFile, withExtension: "jpg"),
                   let imageData = try? Data(contentsOf: imageURL),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 280, height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    // Fallback square if image not found
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(red: 19/255, green: 64/255, blue: 46/255))
                        .frame(width: 280, height: 280)
                        .overlay(
                            Image(systemName: "music.note")
                                .font(.system(size: 80))
                                .foregroundStyle(.white)
                        )
                }
                
                VStack(spacing: 15) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Find your inner peace")
                        .foregroundStyle(.white.opacity(0.8))
                        .font(.title3)
                }
                
                // Play/Pause button
                Button(action: {
                    if isPlaying {
                        pauseAudio()
                    } else {
                        playAudio()
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 80))
                        .foregroundStyle(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            setupAudio()
        }
        .onDisappear {
            stopAudio()
        }
    }
    
    private func setupAudio() {
        if let url = Bundle.main.url(forResource: audioFile, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            } catch {
                print("Error loading audio: \(error)")
            }
        }
    }
    
    private func playAudio() {
        if let player = audioPlayer {
            player.play()
            isPlaying = true
        }
    }
    
    private func pauseAudio() {
        audioPlayer?.pause()
        isPlaying = false
    }
    
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        isPlaying = false
    }
}

#Preview {
    NavigationStack {
        playerPage(audioFile: "meditation1", title: "Mindfulness Meditation")
    }
} 
