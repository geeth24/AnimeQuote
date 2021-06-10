//
//  Quote.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 5/14/21.
//

import Foundation

struct QuoteData: Decodable, Encodable{
    var anime: String
    var character: String
    var quote: String
    
    init(anime: String, character: String, quote: String){
        self.anime = anime
        self.character = character
        self.quote = quote
    }
}


