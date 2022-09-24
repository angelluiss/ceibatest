//
//  CardPost.swift
//  ceibatestApp
//
//  Created by inicial on 23/9/22.
//

import SwiftUI

struct CardPost: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ScrollView {
            ForEach((vm.allPost),id: \.self.id ) { item in

                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(radius: 10)
                    
                    VStack {
                        Text(item.title)
                            .font(.title2)
                            .foregroundColor(.green)
                        
                        Text(item.body)
                            .font(.body)
                            .foregroundColor(.black)
                        
                    }
                    .padding(20)
                    .multilineTextAlignment(.trailing)
                }.padding(20)
            }

        }
    }
}

struct CardPost_Previews: PreviewProvider {
    static var previews: some View {
        CardPost()
    }
}
