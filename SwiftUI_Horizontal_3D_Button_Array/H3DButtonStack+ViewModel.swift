//
//  H3DButtonStack+ViewModel.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 29.04.2024.
//

import Foundation

public extension H3DButtonStack {
    
    struct ViewModel {
        
        let buttonImageVMs: [RoundImageButton.ViewModel]
        
        // MARK: - Init.
        public init(buttonImageVMs: [RoundImageButton.ViewModel]) {
            
            self.buttonImageVMs = buttonImageVMs
        }
    }
}
