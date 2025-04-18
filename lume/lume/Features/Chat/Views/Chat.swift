//
//  Chat.swift
//  lume
//
//  Created by Kaleb Ellington on 4/18/25.
//

import SwiftUI

struct ChatView: View {
    @State private var username: String = ""
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 13).foregroundColor(.gray)
            TextField(text: $username) {
                Text("Chat").foregroundColor(.white)
            }
            .padding()
            .foregroundColor(.white)
            .border(Color.white, width: 1)
        }
        .background(Color.gray)
    }
}


#Preview {
    ChatView()
}
