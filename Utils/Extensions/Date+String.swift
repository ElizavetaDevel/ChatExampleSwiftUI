//
//  Date+String.swift
//  ChatExampleSwiftUI
//
//  Created by superuser on 2/19/24
//

import Foundation

extension Date {
   func toHourMinuteString() -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "hh:mm"
       return formatter.string(from: self)
   }
}

