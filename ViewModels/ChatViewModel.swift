//
//  ChatViewModel.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import Foundation

final class ChatViewModel: ObservableObject {
    
    //TODO: add grouping messages
    
    //MARK: - Properties
    
    @Published var messages: [ChatMessage] = []
    
    private let messageService: MessageService?
    
    //MARK: - Methods
    
    init(messageService: MessageService? = DependencyManager.shared.resolve(MessageService.self)) {
        self.messageService = messageService
        observeMessages()
    }
    
    func sendMessage(text: String) {
        let newMessage = ChatMessage(text: text, isOutgoing: true, senderName: "Me", timestamp: Date())
        messageService?.sendMessage(newMessage)
    }
    
    private func observeMessages() {
        messageService?.observeMessages { [weak self] observedMessages in
            self?.messages = observedMessages
        }
    }
    
}

