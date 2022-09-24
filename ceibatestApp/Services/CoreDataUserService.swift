//
//  CoreDataUserService.swift
//  ceibatestApp
//
//  Created by inicial on 23/9/22.
//

import Foundation
import CoreData


class CoreDataUserService {
    // MARK: CoreData
    let container: NSPersistentContainer
    @Published var savedEntities: [UserEntity] = []
    private let containerName: String = "UserDataModel"
    private let entityName: String = "UserEntity"
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        fetchUsers()
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
    
    // MARK: Funciones de CoreData para los usuarios descargados
    func fetchUsers() {
        let request = NSFetchRequest<UserEntity>(entityName: entityName)
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addUser(userData: UserModel) {
        let newUser = UserEntity(context: container.viewContext)
        newUser.id = Double(userData.id ?? 0)
        newUser.name = userData.name
        newUser.email = userData.email
        newUser.phone = userData.phone
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchUsers()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}
