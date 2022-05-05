//
//  ContentView.swift
//  Memorize
//
//  Created by Dzmitry Khamitsevich on 3.05.22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🛥", "🚐", "🛴", "🚜", "🚟", "🛳", "🗿", "🚗", "🚙", "🛵", "🛩", "🚇", "🚀", "🛶", "🚁"]
    
    @State var emojiCount: Int = 14
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65, maximum: 300))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        CardView(content: $0).aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }.font(.largeTitle).padding(.horizontal).foregroundColor(.blue)
        }.padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }
    label: {
        Image(systemName: "minus.circle")
    }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }
    label: {
        Image(systemName: "plus.circle")
    }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
