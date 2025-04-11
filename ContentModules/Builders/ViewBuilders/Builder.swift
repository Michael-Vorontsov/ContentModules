//
//  Builder.swift
//  ContentModules
//
//  Created by Michael Vorotnstov on 02/04/2025.
//
import SwiftUI

typealias View = SwiftUI.View

protocol UIBuilder {
    func view(for viewState: ViewState) -> (any View)?
}
