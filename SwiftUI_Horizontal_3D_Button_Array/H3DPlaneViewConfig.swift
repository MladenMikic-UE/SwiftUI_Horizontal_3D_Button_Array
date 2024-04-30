//
//  H3DPlaneViewConfig.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 29.04.2024.
//

import SwiftUI

public struct H3DPlaneViewConfig {
    
    let fillColor: Color
    let opacity: CGFloat
    
    // MARK: - Init.
    public init(fillColor: Color,
                opacity: CGFloat) {
        
        self.fillColor = fillColor
        self.opacity = opacity
    }
}
