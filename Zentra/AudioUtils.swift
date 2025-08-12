//
//  AudioUtils.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

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
