import Combine

class SearchState: ObservableObject {
    internal init(query: String = "", result: any SearchResultState) {
        self.query = query
        self.result = result
    }
    
    @Published var query: String = ""

    @Published var result: (any SearchResultState)
}

protocol SearchResultState: ViewState {}

extension TableState: SearchResultState {}
extension MessageState: SearchResultState {}
