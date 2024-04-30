//
//  H3DButtonStack.swift
//  SwiftUI_Horizontal_3D_Button_Array
//
//  Created by Mladen Mikic on 29.04.2024.
//

import SwiftUI

public struct H3DButtonStack: View {
    
    private let viewModel: H3DButtonStack.ViewModel
    private let viewConfig: H3DButtonStack.ViewConfig
    @Binding var selectedButtonIndex: Int
    
    // MARK: - Init.
    public init(selectedButtonIndex: Binding<Int>,
                viewModel:H3DButtonStack.ViewModel,
                viewConfig: H3DButtonStack.ViewConfig) {
        
        self._selectedButtonIndex = selectedButtonIndex
        self.viewModel = viewModel
        self.viewConfig = viewConfig
    }
    
    public var body: some View {
        
        ZStack {
            
            HStack(spacing: .zero) {
                
                Spacer().frame(width: viewConfig.padding.leading)
                
                build3DContentView()

                Spacer().frame(width: viewConfig.padding.trailing)
            }
            
            HStack(spacing: .zero) {
                
                Spacer().frame(width: viewConfig.padding.leading * 1.5)
                
                buildContentScrollView()
                
                Spacer().frame(width: viewConfig.padding.trailing * 1.5)
            }
        }
        .frame(height: viewConfig.size.height)
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder private func build3DContentView() -> some View {
        
        Rectangle()
            .fill(viewConfig.horizontal3DPlaneVC.fillColor)
            .opacity(viewConfig.horizontal3DPlaneVC.opacity)
            .frame(height: viewConfig.size.height)
            .cornerRadius(viewConfig.size.height / 3)
            .frame(maxWidth: .infinity)
            .rotation3DEffect(.degrees(45),
                              axis: (x: 1, y: 0, z: 0))
            .scaleEffect(0.95)
    }
    
    @ViewBuilder private func buildContentScrollView() -> some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            Spacer(minLength: viewConfig.padding.leading)
            
            VStack(spacing: .zero) {
                
                HStack(spacing: viewConfig.padding.leading) {
                    
                    ForEach (viewModel.buttonImageVMs.indices, id: \.self) { i in
                        RoundImageButton(viewConfig: viewConfig.buttonViewConfigs[i],
                                         viewModel: viewModel.buttonImageVMs[i],
                                         isSelected: .constant(selectedButtonIndex == i),
                                         action: {
                                            withAnimation {
                                                self.selectedButtonIndex = i
                                            }
                                         })
                            .clipShape(Circle())
                            .compositingGroup()
                        
                            .shadow(color: viewConfig.shadowViewConfig.color,
                                    radius: viewConfig.shadowViewConfig.radius,
                                    x: viewConfig.shadowViewConfig.x,
                                    y: viewConfig.shadowViewConfig.y)
                            .offset(y: self.selectedButtonIndex == i ? -10: 0)
                            .scaleEffect(self.selectedButtonIndex == i ? 1.2: 1.0)
                    }
                }
                
                Spacer().frame(minHeight: 40)
            }
            
            Spacer(minLength: viewConfig.padding.trailing)

        }
        .frame(height: viewConfig.size.height)
        .frame(maxWidth: .infinity)
    }
}
