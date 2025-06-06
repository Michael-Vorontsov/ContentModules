import Combine
import Foundation

public class SearchState: ObservableObject, ViewState, TablePresentableState {
    public let id = UUID()

    public init(query: String = "", result: (any SearchResultState)? = nil) {
        self.query = query
        self.result = result
    }
    
    @Published public var query: String = ""

    @Published public var result: (any SearchResultState)?
}

public protocol SearchResultState: ViewState {}

extension TableState: SearchResultState {}
extension MessageState: SearchResultState {}
