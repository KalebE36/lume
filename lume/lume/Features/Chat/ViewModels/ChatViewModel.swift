
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messageText: String = ""
    @Published var messages: [String] = []
    
    
    
}
