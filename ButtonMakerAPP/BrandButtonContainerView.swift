//
//  BrandButtonContainerView.swift
//  ButtonMakerAPP
//
//  Created by rouzbeh on 01.02.24.
//

import Foundation
import BrandButton
import SwiftUI

struct BrandButtonContainerView: View {
    @Binding var style: ButtonContainerStyle
    init(style: Binding<ButtonContainerStyle>) {
        self._style = style
    }
    var body: some View {
        BrandButton(action: {},
                    isDisabled: $style.isDisabled,
                    color: style.color.color,
                    image: Image(systemName: "star.fill"),
                    style: style.style,
                    mode: style.mode)
        .frame(height: 44)
        .padding()
    }
}
