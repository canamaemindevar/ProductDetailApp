//
//  Logger.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 13.07.2025.
//

import Foundation

class Logger {
    static let shared = Logger()
    
    private var isLoggingEnabled: Bool = ConfigurationManager.environment != .prod
    
    private init() {}
    
    
    // Debug log
    func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        if isLoggingEnabled {
            let fileName = (file as NSString).lastPathComponent
            print("🟢 [DEBUG] \(fileName):\(line) \(function) - \(message)")
        }
    }
    
    // Info log
    func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        if isLoggingEnabled {
            let fileName = (file as NSString).lastPathComponent
            print("🔵 [INFO] \(fileName):\(line) \(function) - \(message)")
        }
    }
    
    // Warning log
    func warning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        if isLoggingEnabled {
            let fileName = (file as NSString).lastPathComponent
            print("🟡 [WARNING] \(fileName):\(line) \(function) - \(message)")
        }
    }
    
    // Error log
    func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        if isLoggingEnabled {
            let fileName = (file as NSString).lastPathComponent
            print("🔴 [ERROR] \(fileName):\(line) \(function) - \(message)")
        }
    }
}
