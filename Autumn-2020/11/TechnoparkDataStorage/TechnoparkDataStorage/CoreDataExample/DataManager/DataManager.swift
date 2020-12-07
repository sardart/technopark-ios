//
//  DataManager.swift
//  TechnoparkDataStorage
//
//  Created by Pavel Tikhonov on 07.12.2020.
//

import CoreData

class DataManager {
    
    private let modelName = "TechnoparkCoreDataModel"
    
    static let shared = DataManager()
    
    private let storeContainer: NSPersistentContainer
    private var isReady = false
    
    var mainQueueContext: NSManagedObjectContext {
        storeContainer.viewContext
    }
        
    private init() {
        self.storeContainer = NSPersistentContainer(name: modelName)
        self.storeContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func initializeCoreDataIfNeeded(success: (() -> Void)?, failure: @escaping (Error) -> Void) {
        guard !isReady else {
            return
        }
        
        storeContainer.loadPersistentStores { (_, error) in
            defer {
                self.isReady = true
            }
            
            guard error == nil else {
                failure(error!)
                return
            }
            
            success?()
        }
    }
    
    func fetch<T>(with request: NSFetchRequest<T>) -> [T]? {
        try? storeContainer.viewContext.fetch(request)
    }
    
    func createObject<T: NSManagedObject>(configBlock: ((T) -> Void)?) {
        storeContainer.performBackgroundTask { (localContext) in
            guard let obj = NSEntityDescription.insertNewObject(forEntityName: "TestItem",
                                                                into: localContext) as? T else {
                return
            }
            
            configBlock?(obj)
            try? localContext.save()
        }
    }
    
    func count<T: NSManagedObject>(for request: NSFetchRequest<T>) -> Int {
        (try? storeContainer.viewContext.count(for: request)) ?? 0
    }
    
}
