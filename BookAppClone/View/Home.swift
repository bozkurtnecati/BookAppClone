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
            
            ScrollView(.vertical, showsIndicators: false) {
                /// Books Card View
                VStack(spacing: 35.0){
                    ForEach(sampleBooks){
                        BookCardView($0)
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 20)
            }
            /// Since we need ofset from here and not from global view
            .coordinateSpace(name: "SCROLLVIEW")
        }
    }
    
    /// Books Card View
    @ViewBuilder
    func BookCardView(_ book: Book)-> some View {
        GeometryReader{
            let size = $0.size
            let frame = $0.frame(in: .named("SCROLLVIEW"))
            
            HStack(spacing: -25){
                /// Book Detail Card
                /// Placing this card above the cover image
                VStack(alignment: .leading, spacing: 6.0){
                    Text(book.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("By \(book.author)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    /// Rating View
                    RatingView(rating: book.rating)
                        .padding(.top, 10)
                     
                    Spacer(minLength: 10)
                    
                    HStack(spacing: 4.0){
                        Text("\(book.bookViews)")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        
                        Text("Views")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(20)
                .frame(width: size.width / 2, height: size.height * 0.8)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        /// Applying Shadow
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                
                /// Book Cover Image
                ZStack{
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width / 2, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        /// Applying Shadow
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: -5, y: -5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: size.width)
        }
        .frame(height: 220)
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

/// Custom Rating View
struct RatingView: View {
    var rating: Int
    var body: some View{
        HStack(spacing: 4.0){
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundColor(index <= rating ? .yellow : .gray.opacity(0.5))
            }
            
            Text("(\(rating))")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                .padding(.leading)
        }
    }
}
