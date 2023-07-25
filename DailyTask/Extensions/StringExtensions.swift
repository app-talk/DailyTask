//
//  StringExtensions.swift
//  DailyTask
//
//  Created by Simon Peter Ojok on 25/07/2023.
//

import Foundation

extension String? {
    func orEmpty() -> String {
        return self ?? ""
    }
}
