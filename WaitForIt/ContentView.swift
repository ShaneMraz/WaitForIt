//
//  ContentView.swift
//  WaitForIt
//
//  Created by Shane Mraz on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var jokeService = JokeService()
    
    var body: some View {
        ZStack {
            Text(jokeService.joke)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            VStack {
                Spacer()
                Button {
                    Task.init {
                        try? await jokeService.fetchJoke()
                    }
                } label: {
                    Text("Fetch a joke")
                        .padding(.bottom)
                        .opacity(jokeService.isFetching ? 0 : 1)
                        .overlay {
                            if jokeService.isFetching {
                                ProgressView()
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
