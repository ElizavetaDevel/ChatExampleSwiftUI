//
//  ChatView.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import SwiftUI

struct ChatView: View {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: ChatViewModel
    @State private var newMessageText: String = ""

    //TODO: - add keyboard observing height
    
    //MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(viewModel.messages, id: \.id) { message in
                                ChatBubble(direction: message.isOutgoing ? .right : .left) {
                                    ChatMessageContent(message: message)
                                }
                            }
                        }
                        .onChange(of: viewModel.messages) {
                            if let lastMessage = viewModel.messages.last {
                                withAnimation {
                                    proxy.scrollTo(lastMessage.id, anchor: .bottom)
                                }
                            }
                        }
                        .onAppear() {
                            if let lastMessage = viewModel.messages.last {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }

                HStack {
                    TextField("Type a message", text: $newMessageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.sendMessage()
                    }) {
                        Text("Send")
                    }
                }
                .padding()
            }
        }
    }

    func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        
        viewModel.sendMessage(text: newMessageText)
        newMessageText = ""
    }
}
