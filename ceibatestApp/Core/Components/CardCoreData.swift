//
//  CardCoreData.swift
//  ceibatestApp
//
//  Created by inicial on 27/9/22.
//

import SwiftUI

struct CardCoreData: View {
    @Binding var itemb: UserModel
    let id: Int
    let name: String
    let phone: String
    let email: String
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
               
                    Text(name)
                        .font(.title)
                        .foregroundColor(Color.theme.accent)
                        .padding(.vertical)
                    
                    HStack{
                        Image(systemName: "phone.fill")
                            .foregroundColor(Color.theme.secondaryText)
                        Text(phone )
                            .font(.body)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    
                    
                    
                    HStack{
                        Image(systemName: "tray.fill")
                            .foregroundColor(Color.theme.secondaryText)
                        Text(email)
                            .font(.body)
                            .foregroundColor(Color.theme.secondaryText)
                    }
                
                
                Button {
                    itemb = UserModel(id: id, name: name, username: "", email: email, address: nil, phone: phone, website: "", company: nil)
                    vm.callSubscriberPosts(id: String(id))
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

struct CardCoreData_Previews: PreviewProvider {
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


