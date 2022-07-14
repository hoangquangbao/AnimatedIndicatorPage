//
//  OffsetPageTabView.swift
//  AnimatedIndicatorPage
//
//  Created by Quang Bao on 13/07/2022.
//

import SwiftUI

//Custom View that will return offset for Paging Control...
struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat

    init(offset: Binding<CGFloat>, @ViewBuilder content: @escaping ()->Content) {
        self._offset = offset
        self.content = content()
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollview = UIScrollView()
        
        //Extracting SwiftUI View and embedding into UIKit ScrollView....
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            
            //if you are using vertical Paging...
            //then dont declare height constraint...
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        
        //Enabling Paging...
        //Cái này sẽ disable độ trớn khi ta scroll
        //the scroll view stops on multiples of the scroll view’s bounds when the user scrolls.
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {

    }
}

struct OffsetPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
