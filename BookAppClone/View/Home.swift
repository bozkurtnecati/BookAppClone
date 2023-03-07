//
//  Home.swift
//  BookAppClone
//
//  Created by Necati Bozkurt on 7.03.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 15.0) {
            HStack {
                Text("Browse")
                    .font(.largeTitle.bold())
                Text("Recommended")
                    .fontWeight(.semibold)
                    .padding(.leading, 15)
                    .foregroundColor(.gray)
                    .offset(y: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
