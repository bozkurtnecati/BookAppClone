//
//  Home.swift
//  BookAppClone
//
//  Created by Necati Bozkurt on 7.03.2023.
//

import SwiftUI

struct Home: View {
    /// View Properties
    @State private var activeTag: String = "Biography"
    /// For Matched Geometry Effect
    @Namespace private var animation
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
            
            TagsView()
        }
    }
    
    /// Tag View
    @ViewBuilder
    func TagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10.0){
                ForEach(tags, id: \.self){ tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background{
                            if activeTag == tag {
                                Capsule()
                                    .fill(Color("Blue"))
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }else{
                                Capsule()
                                    .fill(.gray.opacity(0.2))
                            }
                        }
                        .foregroundColor(activeTag == tag ? .white : .gray )
                        ///  Changing Active Tag When Tapped one of the tag
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag
                            }
                        }
                }
            }
            .padding(.horizontal, 15)
        }
    }
}

/// Sample Tags
var tags: [String] = ["History","Classical","Biography","Cartoon","Adventure","Fairy Tales","Fantasy"]

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
