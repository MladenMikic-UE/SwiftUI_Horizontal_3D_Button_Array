//
//  H3DButtonStack+ViewConfig.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 29.04.2024.
//

import SwiftUI

public extension H3DButtonStack {
    
    struct ViewConfig {
        
        let buttonViewConfigs: [RoundImageButton.ViewConfig]
        let shadowViewConfig: ShadowViewConfig
        let horizontal3DPlaneVC: H3DPlaneViewConfig
        let size: CGSize
        let padding: EdgeInsets
        
        // MARK: - Init.
        public init(buttonViewConfigs: [RoundImageButton.ViewConfig],
                    shadowViewConfig: ShadowViewConfig,
                    horizontal3DPlaneVC: H3DPlaneViewConfig,
                    size: CGSize,
                    padding: EdgeInsets) {
            
            self.buttonViewConfigs = buttonViewConfigs
            self.shadowViewConfig = shadowViewConfig
            self.horizontal3DPlaneVC = horizontal3DPlaneVC
            self.size = size
            self.padding = padding
        }
    }
}
