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
        HStack(spacing: 20) {
            SleepButton()
                .frame(maxWidth: .infinity)
            MeditateButton()
                .frame(maxWidth: .infinity)
            WakeupButton()
                .frame(maxWidth: .infinity)
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
            VStack {
                Image(systemName: "bed.double")
                    .font(.title2)
                Text("Sleep")
                    .font(.caption)
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct MeditateButton: View {
    var body: some View {
        Button(action: {
            // start meditation audio
        }) {
            VStack {
                Image(systemName: "apple.meditate")
                    .font(.title2)
                Text("Meditate")
                    .font(.caption)
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct WakeupButton: View {
    var body: some View {
        Button(action: {
            // start wakeup audio
        }) {
            VStack {
                Image(systemName: "sun.horizon")
                    .font(.title2)
                Text("Wakeup")
                    .font(.caption)
            }
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ContentView()
}
