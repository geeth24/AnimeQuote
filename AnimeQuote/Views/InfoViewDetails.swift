//
//  InfoViewDetails.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 8/13/21.
//

import SwiftUI

struct InfoViewDetails: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical,4)
            HStack{
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!).foregroundColor(.purple)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.purple)
                }
                else {
                    EmptyView()
                }
            }
        }
    }
}

struct InfoViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoViewDetails(name: "Developer", content: "Rad Soft, Inc.")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            InfoViewDetails(name: "Website", linkLabel: "Rad Soft, Inc.", linkDestination: "radsoftinc.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
