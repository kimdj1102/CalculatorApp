//
//  model.swift
//  [1]Calculator
//
//  Created by 김동준 on 12/3/24.
//

import UIKit

struct TextChangeManager {
    var totalResult = 0
    
    mutating func addText(_ currentText: String, _ num: Int) -> String {
        if totalResult == 0 && num == 0 {
            return "0"
        }
        
        let commaRemoved = removeComma(currentText)
        let resultText = commaRemoved + String(num)
        
        if let result = Int(resultText) {
            totalResult = result
            
            return addComma(resultText)
        }
        else {
            return currentText
        }
    }
    
    mutating func removeText(_ currentText: String) -> String {
        var resultText = removeComma(currentText)
        resultText.removeLast()
        
        if resultText == "" {
            totalResult = 0
            
            return "0"
        }
        
        if let result = Int(resultText) {
            totalResult = result
            
            return addComma(resultText)
        }
        else {
            return currentText
        }
        
    }
    
    func addComma(_ text: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let num = Int(text),
           let formattedString = formatter.string(from: NSNumber(value: num)) {
            return formattedString
        }
        else {
            return text
        }
    }
    
    func removeComma(_ text: String) -> String {
        let currentText = text.replacingOccurrences(of: "[.,]", with: "", options: .regularExpression)
        
        return currentText
    }
}



