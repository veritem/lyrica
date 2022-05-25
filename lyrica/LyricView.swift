//
//  LyricView.swift
//  lyrica
//
//  Created by Makuza Mugabo Verite on 25/05/2022.
//

import SwiftUI

struct Lyric: Codable {
    let lyrics: String
}

struct LyricView: View {
    
    @State private var lyric: String = "";
    @State private var loading: Bool = false;
    
    var body: some View {
        ZStack {
            ScrollView {
                Text(lyric).lineLimit(nil)
                Spacer()
            }
            
            
            if loading {
                LoadingView()
                
            }
        }.onAppear{
            Task.init{
                try await loadLyrics()
            }
        }
        
    }
    
    func loadLyrics() async throws {
        loading = true
        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://private-anon-3719a2c6f8-lyricsovh.apiary-proxy.com/v1/Anne%20Marie/2002")!)
        let decodedResponse = try? JSONDecoder().decode(Lyric.self, from: data)
        lyric = decodedResponse?.lyrics ?? ""
        loading = false
    }
}

struct LyricView_Previews: PreviewProvider {
    static var previews: some View {
        LyricView()
    }
}


struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
        }
    }
}
