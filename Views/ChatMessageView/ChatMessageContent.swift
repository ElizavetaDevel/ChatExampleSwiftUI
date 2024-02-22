//
//  MessageBubbleView.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import SwiftUI

struct ChatMessageContent: View {
    
    //MARK: - Properties
    
    let message: ChatMessage //TODO: - add ChatMessageViewModel above ChatMessage, add Appearance theaming
    
    private let minWidth: CGFloat = UIScreen.main.bounds.width * 0.2
    
    private let senderFont = UIFont.systemFont(ofSize: 16, weight: .bold)
    private let messageFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    private let paddingVertical: CGFloat = 12
    private let paddingHorizontal: CGFloat = 16
    private let timestampInset: CGFloat = 20
   
    //MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(message.senderName)
                .font(Font(senderFont))
                .foregroundColor(message.isOutgoing ? .white : .black)
                .frame(minWidth: minWidth, alignment: .leading)
            Text(message.text)
                .font(Font(messageFont))
                .foregroundColor(message.isOutgoing ? .white : .black)
                .frame(minWidth: minWidth, alignment: .leading)
            Spacer().frame(height: timestampInset)
        }
        .overlay(
            HStack {
                Spacer()
                Text(message.timestamp.toHourMinuteString())
                    .font(.footnote)
                    .foregroundColor(message.isOutgoing ? .white : .black)
            }, alignment: .bottom)
        .padding([.vertical], paddingVertical)
        .padding([.horizontal], paddingHorizontal)
        .background {
            message.isOutgoing ? Color.blue.ignoresSafeArea() : Color.gray.ignoresSafeArea()
        }
    }
}
