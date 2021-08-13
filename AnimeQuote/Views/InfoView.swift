//
//  InfoView.swift
//  AnimeQuote
//
//  Created by Geeth Gunnampalli on 8/13/21.
//

import SwiftUI

struct InfoView: View {
 
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView{
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20) {
                        GroupBox(
                            label: InfoViewName(labelText: "AnimeQuote")
                        ){
                            Divider().padding(.vertical, 4)
                            
                            HStack(alignment: .center, spacing: 10) {
                                
                                
                                Text("AnimeQuote is an app for time pass. You can read random anime quotes to pass time. Some may even catch your eye.")
                                    .font(.footnote)
                                
                                
                            }
                            InfoViewDetails(name: "Developer", content: "Rad Soft, Inc.")
                            InfoViewDetails(name: "Designer", content: "Geeth Gunnampalli")
                            InfoViewDetails(name: "Support Site", linkLabel: "Support", linkDestination: "radsoftinc.com")
                            InfoViewDetails(name: "Instagram", linkLabel: "@radsoftinc", linkDestination: "instagram.com/radsoftinc")
                            InfoViewDetails(name: "Image Provider", linkLabel: "Freepik", linkDestination: "freepik.com/vectors/house")
                            InfoViewDetails(name: "Version", content: "1.2")
                            
                            
                            
                        }


                        
                        
                    }.navigationBarTitle(Text("About"), displayMode: .large)
                    .toolbar(content: {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "xmark").foregroundColor(.purple)
                        }
                    }).padding()
      
                    


            }
        }
        
    }
    
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
