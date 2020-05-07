//
//  ProfileDataManager.swift
//  Lecture11App
//
//  Created by Artur Sardaryan on 5/7/20.
//  Copyright © 2020 Artur Sardaryan. All rights reserved.
//

import UIKit

protocol ProfileDataManager {
    func save(name: String?)
    func save(avatar: UIImage?)
    
    func loadName() -> String?
    func loadAvatar() -> UIImage?
    
    func clear()
}
