//
//  ContentView.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var chatViewModel = ChatViewModel()

    var body: some View {
        ChatView(viewModel: chatViewModel)
    }
}


#Preview {
    ContentView()
}
