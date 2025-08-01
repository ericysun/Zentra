//
//  ContentView.swift
//  Zentra
//  An open source meditation app. No Paywalls. No Fees.
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    let quotes = [
        ["If you want to conquer the anxiety of life, live in the moment, live in the breath.", "Amit Ray"],
        ["Peace comes from within. Do not seek it without.", "Buddha"],
        ["Happiness is not something ready made. It comes from your own actions.", "Dalai Lama"]
    ]
    
    @State private var currentQuote = ["", ""]
    
    func getRandomQuote() -> [String] {
        return quotes.randomElement() ?? ["If you want to conquer the anxiety of life, live in the moment, live in the breath.", "Amit Ray"]
    }
    
    var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 0 && hour <= 11 {
            return "Good Morning"
        } else if hour >= 12 && hour <= 16 {
            return "Good Afternoon"
        } else {
            return "Good Evening"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Image("ZentraLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    
                    Text("Zentra")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                
                Text(greeting)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                VStack(spacing: 8) {
                    Text(currentQuote[0])
                        .font(.title2)
                        .italic()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    Text("― \(currentQuote[1])")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.horizontal)
                .onAppear {
                    currentQuote = getRandomQuote()
                }
                
                HStack(spacing: 20) {
                    NavigationLink(destination: WakeupPage()) {
                        WakeupButton()
                    }
                    NavigationLink(destination: MeditatePage()) {
                        MeditateButton()
                    }
                    NavigationLink(destination: SleepPage()) {
                        SleepButton()
                    }
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
