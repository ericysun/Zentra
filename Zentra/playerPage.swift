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
        VStack(spacing: 30) {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text("Find your inner peace")
                .foregroundStyle(.white)
                .font(.title2)
            
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
            }
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