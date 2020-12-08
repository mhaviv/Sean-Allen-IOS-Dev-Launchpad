//
//  ContentView.swift
//  SwiftUI-Videos
//
//  Created by Michael Haviv on 12/7/20.
//

import SwiftUI

struct ContentView: View {
    
    var videos: [Video] = []
    
    var body: some View {
        NavigationView {
            List(videos) { video in
                Image(video.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90.0)
                    .cornerRadius(8)
                Spacer()
                    .frame(width: 16)
                VStack(alignment: .center) {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75) // if you go above 2 lines shrink the font up until 25%
                    Spacer().frame(height: 5)
                    Text(video.uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }.navigationBarTitle(Text("Sean's Videos"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(videos: VideoList.topTwelve)
    }
}
