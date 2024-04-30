//
//  ContentView.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 25.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var backgroundColorScheme: Bool = true
    @State private var selectedButtonIndex: Int = 0
    private var backgroundColor: Color {
        backgroundColorScheme ? Color.white : Color.black
    }
    
    private var buttonColor: Color {
        .red
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("selectedButtonIndex: \(selectedButtonIndex)")
                    .foregroundColor(Color.white)
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                H3DButtonStack(selectedButtonIndex: $selectedButtonIndex, viewModel: .init(buttonImageVMs: [
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay"),
                    
                    RoundImageButton.ViewModel(selectedImageName: "trash-can-front-color", deSelectedImageName: "trash-can-front-clay")
                ]),
                viewConfig: .init(buttonViewConfigs: [
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                                
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC(),
                                
                    RoundImageButton.ViewConfig.defaultRoundImageButtonVC()
                ],
                shadowViewConfig: .defaultRoundImageButtonSVC(),
                horizontal3DPlaneVC: .init(fillColor: Color.white, opacity: 0.4),
                size: .init(width: 120, height: 120),
                padding: .init(top: 0, leading: 20, bottom: 0, trailing: 20)))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}

public extension ShadowViewConfig {
    
    static func defaultRoundImageButtonSVC() -> ShadowViewConfig {
        
        ShadowViewConfig(color: .black.opacity(0.4), radius: 6, x: 3, y: 10)
    }
}

public extension RoundImageButton.ViewConfig {
    
    static func defaultRoundImageButtonVC() -> RoundImageButton.ViewConfig {
        
        RoundImageButton.ViewConfig(roundImageButtonViewConfig: .roundImageButtonImageVC(),
                                    backgroundView: AnyView(GlassView(cornerRadius: 40).clipShape(Circle())))
    }
}

public extension ImageViewConfig {
    
    static func roundImageButtonImageVC() -> ImageViewConfig {
        .init(isSystem: false)
    }
}

public struct ShadowViewConfig {

    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    // MARK: - Init.
    public init(color: Color, 
                radius: CGFloat,
                x: CGFloat,
                y: CGFloat) {
        
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
    
    public static func noShadow() -> ShadowViewConfig {
        return ShadowViewConfig(color: .clear, radius: 0, x: 0, y: 0)
    }
}

