//
//  Home.swift
//  AnimatedIndicatorPage
//
//  Created by Quang Bao on 13/07/2022.
//

import SwiftUI

struct Home: View {
    
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        VStack {
            
            Button {
                
            } label: {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 55, height: 55)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetPageTabView(offset: $offset) {
                
                //Ta không thể dùng GeometryReader ở đây, sẽ chuyển sang ContenView rồi truyền ngược về lại thông qua screenSize variable
//                GeometryReader { proxy in
//                    let size = proxy.size
                    
                    HStack(spacing: 0) {
                        ForEach(intros) { intro in
                            
                            VStack {
                                
                                Image(intro.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: screenSize.height / 3)
                                
                                VStack(alignment: .leading, spacing: 22) {
                                    
                                    Text(intro.title)
                                        .font(.largeTitle.bold())
                                    
                                    Text(intro.description)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.secondary)
                                }
//                                .foregroundStyle(.white)
                                .padding(.top, 50)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding()
                            //Code line will adjust exactly frame of the image
                            .frame(width: screenSize.width)
                        }
                    }
                    //setting max Width...
//                    .frame(width: screenSize.width)
                //}
            }
            
            //Animated Indicator...
            HStack(alignment: .bottom) {
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(10)
                        .background(
//                            Circle()
//                                .foregroundColor(.black)
                            intros[getIndex()].color,
                            in: Circle()
                        )
                }

            }
            .padding()
            .offset(y: -20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)//, alignment: .top)
//        .onChange(of: offset) { _ in
//            print(offset)
//        }
        .animation(.easeInOut, value: getIndex())
    }
    
    //Expanding index base on offset...
    func getIndex() -> Int {
        
        let progress = round(offset / screenSize.width)
        
        //For Saftey...
        let index = min(Int(progress), intros.count - 1)
//        return Int(progress)
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
