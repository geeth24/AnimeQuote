//
//  ContentView.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 5/13/21.
//

import SwiftUI
import AVKit

var counter = 0

var backColor = "Orange1"

var backwards = false

struct ContentView: View {
    
    @State private var quoteData: QuoteData?
    @State var audioPlayer: AVAudioPlayer!
    
    @State var save = false
    
    
    @State var saved = UserDefaults.standard.array(forKey: "savedQuote")
    
   @State var str1 = ""
    
    @State var dataLoaded = false
    
    var body: some View {

        ZStack {
            
            Color("Orange16")
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading) {
                    Text(quoteData?.quote ?? "")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.init("primary"))
                        .padding(.top)
                            .multilineTextAlignment(.leading)
                        .shadow(color: Color(.systemPink), radius: 0.50)

                    
                    if dataLoaded {
                        Text("~ \(quoteData?.character ?? "")")
                            .font(.title3)
                            .foregroundColor(Color.init("primary"))
                            .fontWeight(.semibold)
                            .padding(.top)
                            .shadow(color: Color(.systemPink), radius: 0.50)
                        Text("From: \(quoteData?.anime ?? "")")
                            .font(.footnote)
                            .foregroundColor(Color.init("primary"))
                            .fontWeight(.semibold)
                            .padding(.top, -10.0)
                            .shadow(color: Color(.systemPink), radius: 0.50)
                    } else {}
                    
                    
                }
                .padding()
                .frame(width: 360, height: 400)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                
                
                                            
                
                Spacer()
                    .frame(height: 150.0)
                HStack {
                    Button(action: loadData) {
                        
                        Image(systemName: "arrow.right.circle")
                            .font(.title)
                            .foregroundColor(Color.pink)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                        
                    }
                    .frame(width: 75, height: 75)
                    .background(Color.init("primary"))
                    .cornerRadius(100)
                    .padding()
                    .shadow(color: Color(.systemPink), radius: 0.50)
                    Spacer()
                }.padding()
                
        
            }.onAppear(perform: {
                loadData()
        })
        }
        
    }
    
    private func loadData(){
        guard let url = URL(string: "https://animechan.vercel.app/api/random") else {
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(QuoteData.self, from: data){
                DispatchQueue.main.async {
                    self.quoteData = decodedData
                        backgroundChange()
                    let sound = Bundle.main.path(forResource: "next", ofType: "wav")
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer.play()
                    
                    dataLoaded = true
                }
            }
        }.resume()
    }
    
    func saveQuote(){
    save = true
        if save{

            str1 = String(quoteData?.quote ?? "")
            //self.toDoStorage.toDos.append(QuoteData(anime: "test", character: "test", quote: str1))
            saved?.append(str1)
            //UserDefaults.standard.set(self.saved, forKey: "savedQuote")

        }

    }
}

func backgroundChange(){
    if counter == 0{
        backColor = "Orange1"
        backwards = false
    } else if counter == 1{
        backColor = "Orange2"
    }else if counter == 2{
        backColor = "Orange3"
    }else if counter == 3{
        backColor = "Orange4"
    }else if counter == 4{
        backColor = "Orange5"
    }else if counter == 5{
        backColor = "Orange6"
    }else if counter == 6{
        backColor = "Orange7"
    }else if counter == 8{
        backColor = "Orange9"
    }else if counter == 9{
        backColor = "Orange10"
    }else if counter == 10{
        backColor = "Orange11"
    }else if counter == 11{
        backColor = "Orange12"
    }else if counter == 12{
        backColor = "Orange13"
    }else if counter == 13{
        backColor = "Orange14"
    }else if counter == 14{
        backColor = "Orange15"
    }else if counter == 15{
        backColor = "Orange16"
    }else if counter == 16{
        backColor = "Orange17"
    }else if counter == 17{
        backColor = "Orange18"
    }else if counter == 18{
        backColor = "Orange19"
    }else if counter == 19{
        backColor = "Orange20"
    }else if counter == 20{
        backwards = true
    }
    if backwards == true{
        counter-=1
    }else{
        counter+=1
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
