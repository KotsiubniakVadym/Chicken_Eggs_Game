//
//  ProfileViewModel.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI
import Combine

final class ProfileViewModel: ObservableObject {
    
    /// false - male, true - female
    @Published var gender: Bool
    @Published var userName: String
    
    init() {
        self.gender = UserDefaults.standard.bool(forKey: "gender")
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? "player1"
    }
    
    func saveProfile() {
        UserDefaults.standard.set(gender, forKey: "gender")
        if !userName.isEmpty {
            UserDefaults.standard.set(userName, forKey: "userName")
        }
    }
}
