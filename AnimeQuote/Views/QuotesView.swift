//
//  QuotesView.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 8/13/21.
//

import SwiftUI
import AVKit

import SwiftUI

struct QuotesView: View {
    
    @State var quotesData: Quotes
    
    @State var dataLoaded = false
    
    @State private var isShowingSettings = false

    
    var body: some View {
        ZStack{
            Image("Street")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 5)

            ZStack{
                HStack {
                    Button(action: loadData) {
                        
                        if dataLoaded{
                        Image(systemName: "arrow.right.circle")
                            .font(.title)
                            .foregroundColor(.purple)
                            .shadow(color: Color(.purple), radius: 7)
                        }else{
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color.purple))
                                .shadow(color: Color(.purple), radius: 7)
                        }
                        
                    }
                    .frame(width: 75, height: 75)
                    .background(Color.init("Anime"))
                    .cornerRadius(100)
                    .padding()
                    .shadow(color: Color(.purple), radius: 7)
                    
                }.padding()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
            
            ZStack{
                Button(action: {
                    isShowingSettings = true
                    
                }){
                    Image(systemName: "info.circle")
                        .foregroundColor(Color.init("Anime"))
                        .font(.title3)

                }
                .sheet(isPresented: $isShowingSettings){
                    InfoView()
                }
                .padding()
                .shadow(color: Color(.purple), radius: 7)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            
            VStack {
                VStack(alignment: .leading) {
                    
                    
                    
                    if dataLoaded {
                        
                        Text(quotesData.quote)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init("Anime"))
                            .padding(.top)
                            .multilineTextAlignment(.leading)
                            .shadow(color: Color(.purple), radius: 7)
                        
                        Text("~ \(quotesData.character)")
                            .font(.title3)
                            .foregroundColor(Color.init("Anime"))
                            .fontWeight(.semibold)
                            .padding(.top)
                            .shadow(color: Color(.purple), radius: 7)
                        Text("From: \(quotesData.anime)")
                            .font(.footnote)
                            .foregroundColor(Color.init("Anime"))
                            .fontWeight(.semibold)
                            .padding(.top, -10.0)
                            .shadow(color: Color(.purple), radius: 7)
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.purple))                            .shadow(color: Color(.purple), radius: 7)
                    }
                    
                    
                }
                .padding()
                .frame(width: 360, height: 400)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                
            }.onAppear{
                loadData()
            }
        }
    }
    
    func loadData(){
        dataLoaded = false
        guard let url = URL(string: "https://animechan.vercel.app/api/random") else{
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(Quotes.self, from: data){
                DispatchQueue.main.async{
                    self.quotesData = decodedData
                    dataLoaded = true
                    
                }
            }
        }.resume()
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView(quotesData: Quotes(anime: "Loading...", character: "Loading...", quote: "Loading..."))
    }
}
