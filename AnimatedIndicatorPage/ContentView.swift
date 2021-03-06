//
//  ContentView.swift
//  AnimatedIndicatorPage
//
//  Created by Quang Bao on 13/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //Getting ScreenSize Globally...
        GeometryReader { proxy in
            let screenSize = proxy.size
            
            Home(screenSize: screenSize)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
