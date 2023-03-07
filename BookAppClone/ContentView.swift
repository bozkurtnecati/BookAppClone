//
//  ContentView.swift
//  BookAppClone
//
//  Created by Necati Bozkurt on 7.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
