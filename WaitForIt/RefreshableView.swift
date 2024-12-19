//
//  RefreshableView.swift
//  WaitForIt
//
//  Created by Shane Mraz on 12/18/24.
//

import SwiftUI

struct RefreshableView: View {
    @StateObject var jokeService = JokeService()
    
    var body: some View {
        List {
            Text("Chuck Norris Joke")
                .font(.largeTitle)
                .listRowSeparator(.hidden)
                .accessibility(identifier: "jokeTitle")
            Text(jokeService.joke)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .lineSpacing(5.0)
                .padding()
                .font(.title)
                .accessibility(identifier: "jokeContent")
        }
        .task {
            try? await jokeService.fetchJoke()
        }
        .refreshable {
            try? await jokeService.fetchJoke()
        }
    }
}

#Preview {
    RefreshableView()
}
