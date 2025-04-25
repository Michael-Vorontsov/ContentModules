//
//  ZStackState.swift
//  ContentModulesPackage
//
//  Created by Michael Vorotnstov on 25/04/2025.
//
import Combine
import Foundation

public final class ZStackState: ViewState, ObservableObject, TablePresentableState {
    public let id = UUID()

    public init(content: [any TablePresentableState]) {
        self.content = content
    }
    
    @Published var content: [any TablePresentableState]
}
