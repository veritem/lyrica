//
//  ContentView.swift
//  randoma
//
//  Created by Makuza Mugabo Verite on 24/05/2022.
//

import SwiftUI

class FormViewModel: ObservableObject {
    @State var musicTitle: String = ""
    @State var artistName: String = ""
}

struct ContentView: View {
 
    @StateObject var viewModel  = FormViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section {
                        TextField("Music title", text: $viewModel.musicTitle)
                        TextField("Artist name", text: $viewModel.artistName)
                    }
                }
                Button(action: {
                     //TODO: handle searching here
                    print("Pressed")
                }, label: {
                        Text("Search").frame(width: 250, height: 50, alignment: .center)
                }).background(Color.blue)
                  .foregroundColor(.white)
                  .cornerRadius(8)
                  .padding()
            }
            .navigationTitle("Lyrica")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
