//
//  SleepPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI

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

#Preview {
    NavigationStack {
        SleepPage()
    }
} 