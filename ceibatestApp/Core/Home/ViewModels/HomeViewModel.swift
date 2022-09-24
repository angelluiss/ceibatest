//
//  HomeViewModel.swift
//  ceibatestApp
//
//  Created by inicial on 22/9/22.
//

import Foundation
import Combine
import CoreData


class HomeViewModel: ObservableObject {
    
  
    @Published var allUser: [UserModel] = []
    @Published var allPost: [PostModel] = []
//    @Published var userCoreData: [UserEntity] = []
  
    @Published var isLoading: Bool = false

    @Published var searchText: String = ""
    private let userDataService = UserDataService()
    private var cancellables = Set<AnyCancellable>()
    private let coreDataUserService = CoreDataUserService()
    
    
    init() {
        
        addSubscribers()
        
    }
    
    // MARK: Suscriber para datos de la web
    func addSubscribers() {
        
        // Subscribe to Web Service for data users

            userDataService.$allUsers
                
                .sink { [weak self] (returnedUsers) in
                    self?.allUser = returnedUsers
                    
                    // Store all user into the Coredata
                    if (self?.coreDataUserService.savedEntities.count ?? 0 <= 0 ){
                        for user in returnedUsers {
                            self?.coreDataUserService.addUser(userData: user)
                        }
                    }
                }
                .store(in: &cancellables)

            // Subscribe to Core Data Local for data users
            /* // MARK: Detalle de Core Data para devolver a la vista
             Sorry no pude transformar el type
             UserEntity -> UserModel para devolver lo guardado en core data
             a la vista.
             
             Sin embargo, dejo una propuesta que aún no me ha funcionado:
             Usando Combine y .compactMap para tranformar la data
             espero puedan ayudarme con su feedback
             
             ///////////
             $allUser
                 .combineLatest(coreDataUserService.$savedEntities)
                 .map(mapAllUserToUserCoreData)
                 .sink { [weak self] (returnedUsers) in
                     guard let self = self else { return }
                     self.allUser = returnedUsers
                 }
                 .store(in: &cancellables)
             /////////////
            */

        
        
        
        
    }
    

    func callSubscriberPosts(id: String) {
        
        userDataService.getPost(id: id)
        userDataService.$allPosts
            .sink { [weak self] (returnedPost) in
                self?.allPost = returnedPost
            }
            .store(in: &cancellables)
        
    }
    
    private func mapAllUserToUserCoreData(allUser: [UserModel], userEntity: [UserEntity]) -> [UserModel] {
         allUser
            .compactMap { (user) -> UserModel? in
                guard userEntity.first(where: {
                    
                    
                     return $0.id == Double(user.id ?? 0) && $0.phone == user.phone && $0.name == user.name && $0.email == user.email;
                     
                }) != nil else {
                    return nil
                }
                
                return user.updateUsers()
            }
    }
   
    
}

