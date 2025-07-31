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
        NavigationStack {
            HStack(spacing: 20) {
                NavigationLink(destination: SleepPage()) {
                    SleepButton()
                }
                NavigationLink(destination: MeditatePage()) {
                    MeditateButton()
                }
                NavigationLink(destination: WakeupPage()) {
                    WakeupButton()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        }
    }
}

struct SleepButton: View {
    var body: some View {
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

struct MeditateButton: View {
    var body: some View {
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

struct WakeupButton: View {
    var body: some View {
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

struct SleepPage: View {
    var body: some View {
        VStack {
            Text("Sleep Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("Time to rest and rejuvenate")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeditatePage: View {
    var body: some View {
        VStack {
            Text("Meditation Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("Find your inner peace")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WakeupPage: View {
    var body: some View {
        VStack {
            Text("Wake Up Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("Start your day with energy")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}
