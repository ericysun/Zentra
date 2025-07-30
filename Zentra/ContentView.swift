//
//  ContentView.swift
//  Zentra
//  An open source meditation app. No Paywalls. No Fees.
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Start a Serenity Session")
                .foregroundStyle(.white)
                .padding()
                .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
            
            SleepButton()
            MeditateButton()
            WakeupButton()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
    }
}

struct SleepButton: View {
    var body: some View {
        Button(action: {
            // Starts a sleep aid audio
        }) {
            Label("Sleep", systemImage: "bed.double")
                .foregroundStyle(.white)
                .padding()
                .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct MeditateButton: View {
    var body: some View {
        Button(action: {
            // start meditation audio
        }) {
            Label("Meditate", systemImage: "apple.meditate")
                .foregroundStyle(.white)
                .padding()
                .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct WakeupButton: View {
    var body: some View {
        Button(action: {
            // start wakeup audio
        }) {
            Label("Wakeup", systemImage: "sun.horizon")
                .foregroundStyle(.white)
                .padding()
                .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ContentView()
}
