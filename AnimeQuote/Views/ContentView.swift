//
//  ContentView.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 5/13/21.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        QuotesView(quotesData: Quotes(anime: "Loading...", character: "Loading...", quote: "Loading..."))
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
