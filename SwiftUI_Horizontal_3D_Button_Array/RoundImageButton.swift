//
//  RoundImageButton.swift
//  RMSwiftUI
//
//  Created by Mladen Mikic on 18.08.2022.
//

import SwiftUI

public struct RoundImageButton: View {

    private var action: (() -> Void)
    public let viewConfig: RoundImageButton.ViewConfig
    public let viewModel: RoundImageButton.ViewModel
    @Binding public var isSelected: Bool
    
    // MARK: - Init.
    public init(viewConfig: RoundImageButton.ViewConfig,
                viewModel: RoundImageButton.ViewModel,
                isSelected: Binding<Bool>,
                action: @escaping (() -> Void) = {}) {
        self.viewConfig = viewConfig
        self.viewModel = viewModel
        self._isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        if let backgroundView = viewConfig.backgroundView {
            buildContentView()
                .background(backgroundView)
        } else {
            buildContentView()
        }
    }
    
    @ViewBuilder private func buildContentView() -> some View {
        
        Button {
            self.action()
        } label: {
            buildImageView()
                .frame(width: self.viewConfig.roundImageButtonViewConfig.imageSize.width,
                       height: self.viewConfig.roundImageButtonViewConfig.imageSize.height)
                //.foregroundColor(viewConfig.roundImageButtonViewConfig.foreGroundColor)
        }
        .frame(width: self.viewConfig.roundImageButtonViewConfig.size.width,
               height: self.viewConfig.roundImageButtonViewConfig.size.height)
    }
    
    @ViewBuilder func buildImageView() -> some View {
        let imageName: String = self.isSelected ? viewModel.selectedImageName: viewModel.deSelectedImageName
        if viewConfig.roundImageButtonViewConfig.isSystem {
            Image(systemName: imageName)
                .resizable()
        } else {
            Image(imageName, bundle: viewConfig.roundImageButtonViewConfig.bundle)
                .resizable()
        }
    }
}
