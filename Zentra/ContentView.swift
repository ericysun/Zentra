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
        ["Happiness is not something ready made. It comes from your own actions.", "Dalai Lama"],
        ["The quieter you become, the more you are able to hear.","Rumi"],
        ["Meditation is bringing the mind home.","Sogyal Rinpoche"],
        ["I took a deep breath and listened to the old brag of my heart. I am, I am, I am.","Sylvia Plath"],
        ["What lies behind us and what lies before us are tiny matters compared to what lies within us.","Ralph Waldo Emerson"],
        ["The more man meditates upon good thoughts, the better will be his world and the world at large.","Confucius"],
        ["Be where you are; otherwise you will miss your life.","Buddha"]
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
                    NavigationLink(destination: MeditatePage()) {
                        MeditateButton()
                    }
                    NavigationLink(destination: GuidedPage()) {
                        GuidedButton()
                    }
                }
                
                HStack(spacing: 20) {
                    NavigationLink(destination: WakeupPage()) {
                        WakeupButton()
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

#Preview {
    ContentView()
}
