//
//  QuoteWidgetView.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 8/13/21.
//

import SwiftUI
import WidgetKit

struct QuoteWidgetView: View {
    
    var data: Model

    var body: some View {
        
        ZStack {
            
            Image("House")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 3)
            
            VStack(alignment: .leading) {
                Text(data.quotesData.quote)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.init("Anime"))
                    .padding(.top)
                    .multilineTextAlignment(.leading)
                    .shadow(color: Color(.purple), radius: 7)
                
                Text("~ \(data.quotesData.character)")
                    .font(.title3)
                    .foregroundColor(Color.init("Anime"))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .shadow(color: Color(.purple), radius: 7)
                Text("From: \(data.quotesData.anime)")
                    .font(.footnote)
                    .foregroundColor(Color.init("Anime"))
                    .fontWeight(.semibold)
                    .padding(.top, -10.0)
                    .shadow(color: Color(.purple), radius: 7)
            }
            .padding()
            .frame(width: 330, height: 350)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
        }.background(Color.purple)
    }
}

struct QuoteWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetView(data: Model(date: Date(),quotesData: Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal.")))
        .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
