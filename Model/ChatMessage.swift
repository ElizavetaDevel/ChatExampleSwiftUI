//
//  ChatMessage.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24.
//

import Foundation

//TODO: add message types: Image, File, VoiceNote

struct ChatMessage: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let text: String
    let isOutgoing: Bool
    let senderName: String
    let timestamp: Date
}


