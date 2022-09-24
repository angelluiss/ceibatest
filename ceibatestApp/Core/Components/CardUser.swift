//
//  CardUser.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import SwiftUI

struct CardUser: View {
    let item: UserModel
    @Binding var toDestiny: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.25),
                    radius: 10, x: 0, y: 0)
            
            VStack (alignment: .leading){
               
                    Text(item.name ?? "")
                        .font(.title)
                        .foregroundColor(Color.theme.accent)
                        .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.theme.secondaryText)
                        Text(item.phone ?? "")
                            .font(.body)
                            .foregroundColor(Color.theme.secondaryText)
                    }
 
                    HStack{
                        Image(systemName: "tray.fill")
                            .foregroundColor(Color.theme.secondaryText)
                        Text(item.email ?? "")
                            .font(.body)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                
                
                Button {
                    withAnimation(.spring()) {
                        toDestiny.toggle()
                    }
                    
                } label: {
                    Text("Volver a Home")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
                .frame( height: 50)
                .background(
                    Color.theme.accent
                )
                .cornerRadius(30)
                .shadow(
                    color: Color.theme.accent.opacity(0.25),
                    radius: 10, x: 0, y: 0)
             
                

            }
            
        }
    }
}

struct CardUser_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CardUser(item: MockUser.userModel, toDestiny: .constant(true))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            CardUser(item: MockUser.userModel, toDestiny: .constant(true))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
