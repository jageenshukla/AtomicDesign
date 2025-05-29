import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        TextField("Search songs", text: $searchText)
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}
