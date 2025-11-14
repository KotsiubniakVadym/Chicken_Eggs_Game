//
//  SettingsViewModel.swift
//  Chicken_Eggs_Game
//
//  Created by Vadim Koc on 14.11.2025.
//

import SwiftUI
import Combine

final class SettingsViewModel: ObservableObject {
    
    @Published var isSoundEnabled: Bool
    @Published var isNotificationEnabled: Bool
    @Published var isVibrationEnabled: Bool
    
    init() {
        self.isSoundEnabled = UserDefaults.standard.bool(forKey: "isSoundEnabled")
        self.isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
        self.isVibrationEnabled = UserDefaults.standard.bool(forKey: "isVibrationEnabled")
    }
    
    func saveSettings() {
        UserDefaults.standard.set(isSoundEnabled, forKey: "isSoundEnabled")
        UserDefaults.standard.set(isNotificationEnabled, forKey: "isNotificationEnabled")
        UserDefaults.standard.set(isVibrationEnabled, forKey: "isVibrationEnabled")
    }
}
