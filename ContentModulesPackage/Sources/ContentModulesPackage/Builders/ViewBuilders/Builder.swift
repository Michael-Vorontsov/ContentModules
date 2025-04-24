//
//  Builder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//
import SwiftUI

public typealias View = SwiftUI.View

public protocol UIBuilder {
    @MainActor func view(for viewState: ViewState) -> (any View)?
}
