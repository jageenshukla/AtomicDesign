import Foundation

struct Song: Identifiable {
    let id = UUID() // Add unique identifier
    let name: String
    let artist: String
}

let songs: [Song] = [
    Song(name: "Shape of You", artist: "Ed Sheeran"),
    Song(name: "Blinding Lights", artist: "The Weeknd"),
    Song(name: "Someone Like You", artist: "Adele"),
    Song(name: "Bohemian Rhapsody", artist: "Queen"),
    Song(name: "Hotel California", artist: "Eagles"),
    Song(name: "Rolling in the Deep", artist: "Adele"),
    Song(name: "Perfect", artist: "Ed Sheeran"),
    Song(name: "Stairway to Heaven", artist: "Led Zeppelin"),
    Song(name: "Thinking Out Loud", artist: "Ed Sheeran"),
    Song(name: "Let It Be", artist: "The Beatles")
]
