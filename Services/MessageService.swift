//
//  MessageService.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import Foundation

protocol MessageService {
    func sendMessage(_ message: ChatMessage)
    func observeMessages(completion: @escaping ([ChatMessage]) -> Void)
}

final class MockMessageService: MessageService {
    
    //MARK: - Properties
    
    private var messages: [ChatMessage] = []
    private var observers: [([ChatMessage]) -> Void] = []
    
    //MARK: - Init
    
    init() {
        for _ in 1...200 {
            let isOutgoing = Bool.random()
            let message = ChatMessage(
                text: generateRandomMessage(length: randomIntInRange(5, 50)),
                isOutgoing: isOutgoing,
                senderName: isOutgoing ? "Me" : "Alice",
                timestamp: Date()
            )
            
            messages.append(message)
        }
    }
    
    //MARK: - Public methods
    
    func sendMessage(_ message: ChatMessage) {
        messages.append(message)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let receivedMessage = ChatMessage(text: "Received: \(message.text)", isOutgoing: false, senderName: "Alice", timestamp: Date())
            self.messages.append(receivedMessage)
            self.notifyObservers()
        }
        
        notifyObservers()
    }
    
    func observeMessages(completion: @escaping ([ChatMessage]) -> Void) {
        observers.append(completion)
        completion(messages)
    }
    
    //MARK: - Private methods
    
    private func notifyObservers() {
        for observer in observers {
            observer(messages)
        }
    }
    
    private func randomIntInRange(_ min: Int, _ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    private func generateRandomMessage(length: Int) -> String {
        let loremIpsumText = """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            """
        
        let words = loremIpsumText.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        let numWords = min(length, words.count)
        let randomWords = (0..<numWords).map { _ in words.randomElement()! }
        let randomMessage = randomWords.joined(separator: " ")
        
        return randomMessage
    }
    
}


