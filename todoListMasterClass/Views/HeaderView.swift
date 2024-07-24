//
//  HeaderView.swift
//  todoListMasterClass
//
//  Created by Danielle Kaye on 7/15/24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        VStack{
            // Header
            // We want a Z-Stack?
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                    .offset(y:0)
                
                VStack{
                    
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    Text(subtitle)
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                
                .padding(.top, 80)
                
            }
            // End of ZStack
            
            .frame(width: UIScreen.main.bounds.width * 3, height: 350) // The width should be wider than the entirety of the screen, because once we rotate it we don't want it to be cut off
            .offset(y: -150)
        }
    }
    
    struct HeaderView_Previews: PreviewProvider{
        static var previews: some View{
            HeaderView(title: "Title",
                       subtitle: "Subtitle",
                       angle: 15,
                       background: Color.blue)
            
            
        }
        
        
    }
    
}
