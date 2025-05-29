import SwiftUI

struct SongCellImage: View {
    let letter: String

    var body: some View {
        Text(letter)
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 50, height: 50)
            .background(Color.blue)
            .clipShape(Circle())
    }
}
