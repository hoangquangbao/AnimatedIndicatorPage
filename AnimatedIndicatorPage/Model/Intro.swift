//
//  Intro.swift
//  AnimatedIndicatorPage
//
//  Created by Quang Bao on 13/07/2022.
//

import SwiftUI

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

var intros: [Intro] = [
    Intro(image: "img_pic1", title: "To work with happy", description: "While you working that mean you are live", color: Color("Blue")),
    Intro(image: "img_pic2", title: "Love for your life", description: "Love in the world is big love", color: Color("Pink")),
    Intro(image: "img_pic3", title: "My family is best important", description: "Nothing can replace for our family, it's best thing in each life's personal", color: Color("Yellow"))
]
