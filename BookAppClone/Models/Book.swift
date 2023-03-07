//
//  Book.swift
//  BookAppClone
//
//  Created by Necati Bozkurt on 7.03.2023.
//

import SwiftUI

/// Book Model

struct Book: Identifiable, Hashable{
    var id: String = UUID().uuidString
    var title: String
    var imageName: String
    var author: String
    var rating: Int
    var bookViews: Int
}

var sampleBooks: [Book] = [
    .init(title: "Gece Yarısı Kütüphanesi", imageName: "book1", author: "Matt Haig", rating: 4, bookViews: 1023),
    .init(title: "Kasem", imageName: "book2", author: "Eray Hacıosmanoğlu", rating: 5, bookViews: 2049),
    .init(title: "Mahfuz", imageName: "book3", author: "Eray Hacıosmanoğlu", rating: 4, bookViews: 920),
    .init(title: "Osmanlıyı Yeniden Keşfetmek", imageName: "book4", author: "İlber Ortaylı", rating: 3, bookViews: 560),
    .init(title: "Var Mısın", imageName: "book5", author: "Doğan Cüceloğlu", rating: 5, bookViews: 240)
]
