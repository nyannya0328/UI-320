//
//  Home.swift
//  UI-320 (iOS)
//
//  Created by nyannyan0328 on 2021/10/03.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 13) {
                        
                        Text("Weeekly Icons")
                            .font(.largeTitle.bold())
                            .foregroundColor(.black)
                        
                        
                        Text("report is available")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .overlay(
                            Text("2")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color("Pink"),in: Circle())
                                
                                .offset(x: 11, y: -12)
                            
                            ,alignment: .topTrailing
                            
                            
                            )
                        
                            .padding(15)
                            .offset(x: -2)
                            .background(Color.white,in:Circle())
                        
                    }

                    
                    
                    
                }
                
                
                GraphView(donwloads: downloads)
                
                
                HStack(spacing:0){
                    
                    
                    UserProgress(title: "New User", color: Color("LightBlue"), image: "person", progress: 68)
                    
                    
                    UserProgress(title: "old User", color: Color("Pink"), image: "person.fill", progress: 75)
                    
                    
                    
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                .padding(.vertical,10)
                
                VStack{
                    
                    
                    HStack{
                        
                        Text("Most Downloaded icons")
                            .font(.title2.weight(.semibold))
                        
                        Spacer()
                        
                        
                        Menu {
                            
                            Button("More"){}
                            Button("Extra"){}
                            
                            
                        } label: {
                            
                            Image("menu")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                            
                            
                        }

                        
                    }
                    
                    
                    
                    HStack(spacing:15){
                        
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                            .padding(10)
                            .background(
                            
                            
                                .gray.opacity(0.3),in: Circle()
                            
                            )
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Fire Flame")
                                .font(.callout)
                                .foregroundColor(.black)
                            
                            
                            Text("1290 Downloads")
                                .font(.system(size: 10, weight: .ultraLight))
                            
                            
                            
                        }
                        
                        
                        Spacer()
                        
                        
                        Button {
                            
                        } label: {
                            
                            
                            Image(systemName: "square.and.arrow.down.on.square.fill")
                                .foregroundColor(.green)
                                
                        }

                        
                        
                    }
                   
                    
                    
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                
                
                
            }
            .padding()
            
            
            
        }
    }
    @ViewBuilder
    func UserProgress(title : String,color :Color,image :String,progress : CGFloat)->some View{
        
        HStack{
            
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(.gray)
                .foregroundColor(color)
                .padding(10)
                .background(
                
                    ZStack{
                        
                        
                        Circle()
                            .stroke(.gray.opacity(0.3),lineWidth:2)
                        
                        
                        Circle()
                            .trim(from: 0, to: progress / 100)
                            .stroke(color,lineWidth: 2)
                    }
                
                )
            
            
            VStack(alignment: .leading, spacing: 13) {
                
                
               Text("\(Int(progress))")
                    .fontWeight(.thin)
                
                
                Text(title)
                    .foregroundColor(.gray)
                    
                
                
                
            }
            
            
            
            
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        
        
    }
    
   
   

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
