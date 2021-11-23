//
//  BaseView.swift
//  UI-320 (iOS)
//
//  Created by nyannyan0328 on 2021/10/03.
//

import SwiftUI

struct BaseView: View {
    @State var currentTab = "home"
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection:$currentTab){
                
                
                Home()
                    .modifier(BackGroundModifier())
                    .tag("home")
                
                Text("Graph")
                    .modifier(BackGroundModifier())
                    .tag("graph")
                
                Text("chat")
                    .modifier(BackGroundModifier())
                    .tag("chat")
                
                Text("Setting")
                    .modifier(BackGroundModifier())
                    .tag("settings")
            }
            HStack(spacing:35){
                
                
                TabButton(image: "home")
                TabButton(image: "graph")
                
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .padding(20)
                        .background(
                        
                        Color("DarkBlue"),in: Capsule()
                            
                        
                        )
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal,-15)
                .offset(y: -15)

                
                TabButton(image: "chat")
                TabButton(image: "settings")
                
                
            }
            .padding(.top,15)
            .frame(maxWidth: .infinity)
            .background(Color("BG").ignoresSafeArea())
        }
    }
    @ViewBuilder
    func TabButton(image : String)-> some View{
        
        Button {
            withAnimation{
                
                currentTab = image
            }
        } label: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                
                    currentTab == image ? Color.black : Color.gray
                
                )
        }

    }
    
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

struct BackGroundModifier : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BG").ignoresSafeArea())
    }
}
