//
//  ButtonComponents.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI

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

struct GuidedButton: View {
    var body: some View {
        VStack {
            Image(systemName: "person.line.dotted.person")
                .font(.title2)
            Text("Guided")
                .font(.caption)
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(red: 19/255, green: 64/255, blue: 46/255), in: RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack(spacing: 20) {
        SleepButton()
        MeditateButton()
        WakeupButton()
        GuidedButton()
    }
    .padding()
    .background(Color(red: 164/255, green: 204/255, blue: 156/255))
} 