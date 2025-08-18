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
    @State private var currentTime: TimeInterval = 0
    @State private var duration: TimeInterval = 0
    @State private var progressTimer: Timer?
    @Environment(\.dismiss) private var dismiss
    
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
                
                // Progress bar
                VStack(spacing: 8) {
                    ProgressView(value: duration > 0 ? currentTime / duration : 0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .white))
                        .scaleEffect(y: 2)
                    
                    HStack {
                        Text(formatTime(currentTime))
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Spacer()
                        
                        Text(formatTime(duration))
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.8))
                    }
                }
                .padding(.horizontal, 20)
                
                // Playback controls
                HStack(spacing: 40) {
                    // Backward 10 seconds
                    Button(action: {
                        skipBackward()
                    }) {
                        Image(systemName: "gobackward.10")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
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
                    
                    // Forward 10 seconds
                    Button(action: {
                        skipForward()
                    }) {
                        Image(systemName: "goforward.10")
                            .font(.system(size: 30))
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.hidden, for: .navigationBar)
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
        .onAppear {
            setupAudio()
        }
        .onDisappear {
            stopAudio()
            progressTimer?.invalidate()
        }
    }
    
    private func setupAudio() {
        if let url = Bundle.main.url(forResource: audioFile, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                duration = audioPlayer?.duration ?? 0
            } catch {
                print("Error loading audio: \(error)")
            }
        }
    }
    
    private func playAudio() {
        if let player = audioPlayer {
            player.play()
            isPlaying = true
            startProgressTimer()
        }
    }
    
    private func pauseAudio() {
        audioPlayer?.pause()
        isPlaying = false
        progressTimer?.invalidate()
    }
    
    private func stopAudio() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        isPlaying = false
        currentTime = 0
        progressTimer?.invalidate()
    }
    
    private func startProgressTimer() {
        progressTimer?.invalidate()
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if let player = audioPlayer {
                currentTime = player.currentTime
            }
        }
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    private func skipForward() {
        if let player = audioPlayer {
            let newTime = min(player.currentTime + 10, duration)
            player.currentTime = newTime
            currentTime = newTime
        }
    }
    
    private func skipBackward() {
        if let player = audioPlayer {
            let newTime = max(player.currentTime - 10, 0)
            player.currentTime = newTime
            currentTime = newTime
        }
    }
}

#Preview {
    NavigationStack {
        playerPage(audioFile: "meditation1", title: "Mindfulness Meditation")
    }
} 
