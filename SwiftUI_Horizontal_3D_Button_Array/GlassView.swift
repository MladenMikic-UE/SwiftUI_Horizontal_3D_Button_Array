//
//  GlassView.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 29.04.2024..
//

import SwiftUI

public struct GlassView: View {
    
    let cornerRadius: CGFloat
    let fill: Color
    let opacity: CGFloat
    let shadowRadius: CGFloat

    // MARK: - Init.
    public init(cornerRadius: CGFloat,
                fill: Color = .white.opacity(0.4),
                opacity: CGFloat = 0.25,
                shadowRadius: CGFloat = 10.0) {
        
        self.cornerRadius = cornerRadius
        self.fill = fill
        self.opacity = opacity
        self.shadowRadius = shadowRadius
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(fill)
            .opacity(opacity)
            .shadow(radius: shadowRadius)
    }
}
