//
//  UserDataService.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//


import Foundation
import Combine

class UserDataService {
    
    @Published var allUsers: [UserModel] = []
    @Published var allPosts: [PostModel] = []
    
    var userSubscription: AnyCancellable?
    
    init() {
        getUser()
    }
    
    func getPost(id: String){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=" + id) else { return }
        userSubscription = NetworkingManager.download(url: url)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allPosts = returnedCoins
                self?.userSubscription?.cancel()
            })
    }
 
    
    func getUser(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        userSubscription = NetworkingManager.download(url: url)
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allUsers = returnedCoins
                self?.userSubscription?.cancel()
            })
    }
    

    
}
