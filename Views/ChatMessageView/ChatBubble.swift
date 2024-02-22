//
//  ChatBubble.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

//https://gist.github.com/prafullakumar/62edd721af39a1bbcc7886da66502b03

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }
        .padding([.top], 8)
        .padding((direction == .right) ? .leading : .trailing, 48)
        .padding((direction == .right) ? .trailing : .leading, 16)
    }
}
