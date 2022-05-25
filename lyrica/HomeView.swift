//
//  ContentView.swift
//  lyrica
//
//  Created by Makuza Mugabo Verite on 24/05/2022.
//

import SwiftUI

class FormViewModel: ObservableObject {
    @Published var musicTitle: String = ""
    @Published var artistName: String = ""
    
    func submit(){
        print(musicTitle)
        print(artistName)
    }
    
}

struct HomeView: View {
    
    @StateObject var viewModel  = FormViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section {
                        TextField("Music title", text: $viewModel.musicTitle)
                        TextField("Artist name", text: $viewModel.artistName)
                    }
                }.background(Color.white)
                
                    Button(action: viewModel.submit, label: {
                        NavigationLink(destination: LyricView()){
                            Text("Search Lyrics")
                        }
                    }).background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                
            }
            .navigationTitle("Lyrica")
            .frame(width: 400, height: 200, alignment: .center)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
