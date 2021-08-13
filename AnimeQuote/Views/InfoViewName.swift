//
//  InfoViewName.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 8/13/21.
//

import SwiftUI

struct InfoViewName: View {
    var labelText: String
    
    var body: some View {
        
        
        HStack {
            Image("AnimeQuote")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .cornerRadius(9)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            
            
        }
    }
}


struct InfoViewName_Previews: PreviewProvider {
    static var previews: some View {
        InfoViewName(labelText: "AnimeQuote")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
