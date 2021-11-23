//
//  GraphView.swift
//  UI-320 (iOS)
//
//  Created by nyannyan0328 on 2021/10/03.
//

import SwiftUI

struct GraphView: View {
    var donwloads : [Download]
    var body: some View {
        VStack{
            
            HStack{
                
                
                Text("Icons Downloads")
                    .font(.headline.weight(.thin))
                    .foregroundColor(.black)
                
                
                Spacer()
                
                
                Menu {
                    
                    Button("Day"){}
                    Button("Month"){}
                    Button("Year"){}
                    
                } label: {
                    
                    HStack{
                        
                        Text("This Week")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                        
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .font(.system(size: 12, weight: .thin))
                            .foregroundColor(.black)
                        
                
                    }
                    
                    
                }


                
                
            }
            
            
            HStack(spacing:8){
                
                Capsule()
                    .fill(Color("LightBlue"))
                    .frame(width: 10,height: 3)
                
                
                Text("DownLoads")
                    .font(.callout.weight(.semibold))
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Graph()
                .padding(.top)
                
            
            
        }
        .padding()
        .background(.white)
        .cornerRadius(18)
        .padding(.top,25)
    }
    
    @ViewBuilder
    func Graph()->some View{
        
        GeometryReader{proxy in
            
            
            ZStack{
                
                VStack(spacing:0){
                    
                    ForEach(getGraphLines(),id:\.self){line in
                        
                        
                        HStack(spacing:10){
                            
                            
                            
                           Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(.gray)
                                .frame(height: 20)
                            
                            
                            Rectangle()
                                .fill(.gray.opacity(0.1))
                                .frame(height: 1)
                                .offset(y: -15)
                            
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .offset(y: -15)
                        
                        
                    }
                    
                    
                }
                
                
                HStack{
                    
                    ForEach(donwloads){download in
                        
                        
                        VStack(spacing:0){
                            
                            VStack(spacing:5){
                                
                                
                                
                                Capsule()
                                    .fill(Color("LightBlue"))
                                
                                Capsule()
                                    .fill(Color("DarkBlue"))
                                
                                
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: download.donwnloads, size: proxy.size))
                            Text(download.weekDay)
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                            
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        
                        
                    }
                    
                }
                .padding(.leading,30)
                
            }
            
            
            
            
            
          
            
            
            
            
        }
        .frame(height: 200)
        
        
    }
    
    
    func getBarHeight(point : CGFloat,size : CGSize)->CGFloat{
        
        let max = getMax()
        
        
        let height = (point / max) * (size.height - 37)
        
        return height
        
    }
    
    func getGraphLines()->[CGFloat]{
        
        let max = getMax()
        var lines : [CGFloat] = []
        lines.append(max)
        
        for index in 1...6{
            
            let progress = max / 6
            
            lines.append(max - (progress * CGFloat(index) ))
            
            
        }
        
        return lines
        
        
        
        
    }
    func getMax()->CGFloat{
        
        
        let max = donwloads.max { first, sec in
            return sec.donwnloads > first.donwnloads
        }?.donwnloads ?? 0
        
        return max
        
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
