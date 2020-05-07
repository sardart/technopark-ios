//
//  ProstoProfileDataManager.swift
//  Lecture11App
//
//  Created by Artur Sardaryan on 5/7/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit

final class ProstoProfileDataManager: ProfileDataManager {
    
    // MARK: - Properties

    private let nameKey = "nameKey"
    private let avatarKey = "avatarKey"
    
    private let fileManager = FileManager.default
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Helpers
    
    private func filePath(for key: String) -> URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
                
        return url?.appendingPathComponent(key + ".jpeg")
    }
    
    // MARK: - ProfileDataManager
    
    func save(name: String?) {
        userDefaults.setValue(name, forKey: nameKey)
    }
    
    func save(avatar: UIImage?) {
        guard let url = filePath(for: avatarKey) else {
            return
        }
        
        let data = avatar?.jpegData(compressionQuality: 1)
        
        do {
            try data?.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadName() -> String? {
        return userDefaults.value(forKey: nameKey) as? String
    }
    
    func loadAvatar() -> UIImage? {
        guard let url = filePath(for: avatarKey), let data = fileManager.contents(atPath: url.path) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    func clear() {
        userDefaults.setValue(nil, forKey: nameKey)
        guard let url = filePath(for: avatarKey) else {
            return
        }
        
        do {
            try fileManager.removeItem(atPath: url.path)
        } catch {
            print(error)
        }
    }
}
