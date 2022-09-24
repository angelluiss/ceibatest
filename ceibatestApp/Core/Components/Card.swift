//
//  Card.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import SwiftUI

struct Card: View {
    @Binding var itemb: UserModel
    let item: UserModel
    let idCalled: String
    @Binding var toDestiny: Bool
    @EnvironmentObject private var vm: HomeViewModel
    
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
                    itemb = item
                    vm.callSubscriberPosts(id: idCalled)
                    withAnimation(.spring()) {
                        toDestiny.toggle()
                    }
                    
                } label: {
                    Text("Ver publicaciones")
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
                .padding()
                

            }
            
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Card(itemb: .constant(MockUser.userModel),item: MockUser.userModel ,idCalled: "3", toDestiny: .constant(true))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            Card(itemb: .constant(MockUser.userModel),item: MockUser.userModel ,idCalled: "3", toDestiny: .constant(true))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
        
    }
       
}
