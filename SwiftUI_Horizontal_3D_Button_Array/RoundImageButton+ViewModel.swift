//
//  RoundImageButton+ViewModel.swift
//  RMSwiftUI
//
//  Created by Mladen Mikic on 18.08.2022.
//

import Foundation


public extension RoundImageButton {
    
    struct ViewModel {
        
        public let selectedImageName: String
        public let deSelectedImageName: String
        
        public init(selectedImageName: String, deSelectedImageName: String) {
            self.selectedImageName = selectedImageName
            self.deSelectedImageName = deSelectedImageName
        }
        
        public init(selectedImageName: String) {
            self.selectedImageName = selectedImageName
            self.deSelectedImageName = selectedImageName
        }
    }
    
}
