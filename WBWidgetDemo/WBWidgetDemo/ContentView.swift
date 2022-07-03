//
//  ContentView.swift
//  WBWidgetDemo
//
//  Created by WENBO on 2022/7/2.
//

import SwiftUI

struct ContentView: View {
    @State var showWidget = false
    @GestureState private var dragOffset: CGFloat = 0
    @State private var position = CGSize.zero
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("WidgetDemo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.all)
                }
                .blur(radius: showWidget ? 20 : 0)
                Spacer()
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                    WidgetCardView()
                        .offset(x: 0, y: showWidget ? (0 + dragOffset + position.height) : 0)
                        .animation(.spring())
                        .onTapGesture {
                            self.showWidget.toggle()
                            self.position = CGSize.zero
                        }
                }
                
                Spacer()
                
                VStack {
                    Text("一款简单开源的小部件工具箱")
                        .font(.footnote)
                        .onTapGesture {
                            UIApplication.shared.open(URL(string: "https://github.com/Littleor/iWidget")!, options: [:]) { _ in
                                
                            }
                        }
                    
                    HStack {
                        Text("Coded By")
                            .padding(.all, 0)
                            .font(.footnote)
                        Text("Littleor")
                            .padding(.all, 0)
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                UIApplication.shared.open(URL(string: "https://github.com/Littleor")!)
                            }
                    }
                    .blur(radius: showWidget ? 20 : 0)
                }
            }
        }
        .gesture(
            DragGesture()
                .updating($dragOffset) { (value, gestureState, transaction) in
                    let delta = value.location.y - value.startLocation.y
                    gestureState = delta
                }
                .onEnded {
                    self.position.height = $0.translation.height
                }
        )
        .onOpenURL(perform: { (url) in
            UIApplication.shared.open(url)
        })
    }
}

struct WidgetCardView: View {
    var kind = "payTools"
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                switch kind {
                case "payTools":
                    PlayToolsMediumView()
                default:
                    PlayToolsMediumView()
                }
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.all)
            .frame(height: 200,
                   alignment: .center)
            .background(.gray)
            .cornerRadius(20)
            .shadow(radius: 12)
        }
        .padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
