//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by Geeth Gunnampalli on 7/30/21.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> Model {
        Model(date: Date(),quotesData: Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal."))
    }

    func getSnapshot(in context: Context, completion: @escaping (Model) -> ()) {
        let entry = Model(date: Date(),quotesData: Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal."))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Model>) -> Void) {
        
        getData{ (modelData) in
            
            let date = Date()
            let data = Model(date: date, quotesData: modelData)
            
            let nextUpdate = Calendar.current.date(byAdding: .minute, value: 1, to: date)
            
            let timeline = Timeline(entries: [data], policy: .after(nextUpdate!))
            
            completion(timeline)
        }
    }
}

func getData(completion: @escaping (Quotes)->()){
    
    let url = "https://animechan.vercel.app/api/random"
    
    let session = URLSession(configuration: .default)
    
    session.dataTask(with: URL(string: url)!){ (data, _,err) in
        
        if err != nil{
            NSLog("qqq: \(err!)")
            
            return
        }
        
        do{
            let jsonData = try JSONDecoder().decode(Quotes.self, from: data!)
            completion(jsonData)
            
        }catch{
            NSLog("qqq: \(err!)")
        }
        
    }.resume()
    
    
    
}

struct Model: TimelineEntry {
    var date: Date
    var quotesData: Quotes
}

struct QuoteWidgetEntryView : View {
    var data: Model

    var body: some View {
       QuoteWidgetView(data: data)
    }
}
struct PlaceholderView: View{

    var data : Model

    var body: some View{
        
        QuoteWidgetView(data: data)
            .redacted(reason: .placeholder)

    }
}

@main
struct QuoteWidget: Widget {
    let kind: String = "QuoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()){ data in
            QuoteWidgetEntryView(data: data)
        }
        .supportedFamilies([.systemLarge])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct QuoteWidget_Previews: PreviewProvider {
    static var previews: some View {
        QuoteWidgetEntryView(data: Model(date: Date(),quotesData: Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal.")))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
        
        PlaceholderView(data: Model(date: Date(),quotesData: Quotes(anime: "One Piece", character: "Monkey D. Luffy", quote: "Then just become stronger. I have my ambition, you have your ambition too. Which means you should just keep walking forward towards that goal.")))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
