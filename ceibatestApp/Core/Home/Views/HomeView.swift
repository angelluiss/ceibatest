//
//  HomeView.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import SwiftUI

struct HomeView: View {
 
    @EnvironmentObject private var vm: HomeViewModel
    
    @State var searchText = ""
    @State var idCalled: Double = 0
    @State var toDetail = false
    @State var itemUser: UserModel = MockUser.userModel
    
    var body: some View {
                   
            
            // content layer
            VStack{
                if(!toDetail){
                    SearchBarView(searchText: $searchText)
                        .padding(EdgeInsets(top: 40, leading: 10, bottom: 10, trailing: 10)).transition(.move(edge: .leading))
                
                    if (vm.allUser.isEmpty && vm.userCoreData.isEmpty){
                        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .green))
                            .scaleEffect(4)
                            .padding(6)
                    }else if(!vm.allUser.isEmpty) {
                        contentHome.transition(.move(edge: .leading))
                    }else{
                        contentHome2.transition(.move(edge: .leading))
                    }
                }else{
                    detailHome.transition(.move(edge: .leading))
                }
            }.background(
                // background layer
                Color.theme.background
                    .edgesIgnoringSafeArea(.all)
            )
        
    }
}


extension HomeView {
    
    private var contentHome: some View {
        
        ScrollView {
            ForEach((vm.allUser).filter({item2 in
                "\(item2)".contains( searchText) || searchText.isEmpty
            }),id: \.self.id ) { item in
           
                
                Card(itemb: $itemUser, item: item, idCalled: String(item.id ?? 0) , toDestiny: $toDetail)
                .padding()
              
            }
            .searchable(text: $searchText)

        }
    }
    
    private var contentHome2: some View {
        
        ScrollView {
            ForEach((vm.userCoreData).filter({item2 in
                "\(item2)".contains( searchText) || searchText.isEmpty
            }),id: \.self.id ) { item in
           
                CardCoreData(itemb: $itemUser, id: Int(item.id), name: item.name ?? "", phone: item.phone ?? "", email: item.email ?? "", toDestiny: $toDetail)
               
                .padding()
              
            }
            .searchable(text: $searchText)

        }
    }
    
    
   
    private var detailHome: some View {
        VStack{
           
            
            VStack{
                CardUser(item: itemUser, toDestiny: $toDetail)
                    .padding()
               
                if (vm.allPost.isEmpty){
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .scaleEffect(2)
                        .padding(6)
                }else {
                    Text("Comentarios:")
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                        .padding(.vertical)
                    
                    CardPost()
                }
            }

        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HomeView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
            
            HomeView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
