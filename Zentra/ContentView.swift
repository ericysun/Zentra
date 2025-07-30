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
        ZStack {
            Color(red: 164/255, green: 204/255, blue: 156/255)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Start a Serenity Session")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(id: "media") {
                ControlGroup {
                    SleepButton()
                    MeditateButton()
                    WakeupButton()
                } label: {
                    Label("Plus", systemImage: "plus")
                }
            }
        }
    }
}

struct SleepButton: View {
    var body: some View {
        Button(action: {
            // Starts a sleep aid audio
        }) {
            Label("Sleep", systemImage: "bed.double")
        }
    }
}

struct MeditateButton: View {
    var body: some View {
        Button(action: {
            // start meditation audio
        }) {
            Label("Meditate", systemImage: "apple.meditate")
        }
    }
}

struct WakeupButton: View {
    var body: some View {
        Button(action: {
            // start wakeup audio
        }) {
            Label("Wakeup", systemImage: "sun.horizon")
        }
    }
}

#Preview {
    ContentView()
}
