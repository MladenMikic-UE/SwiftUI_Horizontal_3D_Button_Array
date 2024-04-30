//
//  RoundImageButton+ViewConfig.swift
//  RMSwiftUI
//
//  Created by Mladen Mikic on 18.08.2022.
//

import Foundation
import SwiftUI


public extension RoundImageButton {
    
    struct ViewConfig {
        
        public let roundImageButtonViewConfig: ImageViewConfig
        public let backgroundView: AnyView?
        
        public init(roundImageButtonViewConfig: ImageViewConfig,
                    backgroundView: AnyView?) {
            self.roundImageButtonViewConfig = roundImageButtonViewConfig
            self.backgroundView = backgroundView
        }
    }
}

public struct ImageViewConfig {
    
    public let size: CGSize
    public let imageSize: CGSize
    public let isSystem: Bool
    public let foreGroundColor: Color
    public let bundle: Bundle?
    public let backgroundColor: Color
    
    public init(size: CGSize = .init(width: 66, height: 66),
                imageSize: CGSize = .init(width: 44, height: 44),
                isSystem: Bool = false,
                foreGroundColor: Color = .clear,
                backgroundColor: Color = .clear,
                bundle: Bundle? = nil) {
        self.size = size
        self.imageSize = imageSize
        self.isSystem = isSystem
        self.foreGroundColor = foreGroundColor
        self.backgroundColor = backgroundColor
        self.bundle = bundle
    }
}
