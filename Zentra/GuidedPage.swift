//
//  GuidedPage.swift
//  Zentra
//  Created by Eric Sun on 7/24/25.
//

import SwiftUI

struct GuidedPage: View {
    var body: some View {
        VStack {
            Text("Guided Session")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Text("Guide a meditation with soothing coach audio")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 164/255, green: 204/255, blue: 156/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GuidedPage()
    }
} 