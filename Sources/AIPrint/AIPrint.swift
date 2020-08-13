import Foundation

public enum LogLevel {
    case naLogLevel
    case verbose
    case debug
    case info
    case warning
    case error
    case assert
    
    var symbol: String {
        switch self {
        case .verbose: return Styles.Console.verboseSymbol
        case .debug: return Styles.Console.debugSymbol
        case .info: return Styles.Console.infoSymbol
        case .warning: return Styles.Console.warningSymbol
        case .error: return Styles.Console.errorSymbol
        case .assert: return Styles.Console.assertSymbol
        default: return ""
        }
    }
}

public func print(_ items: String..., filename: String = #file, function : String = #function, line: Int = #line, separator: String = " ", terminator: String = "\n", severity: LogLevel? = nil) {
    
    let pretty: String = "\(URL(fileURLWithPath: filename).lastPathComponent) [#\(line)] \(function) \((severity ?? .verbose).symbol) "
    let output: String = items.map { "\($0)" }.joined(separator: separator)
    let fullString = pretty+output
    #if DEBUG
    Swift.print(fullString, terminator: terminator)
    #else
    Swift.print("RELEASE MODE")
    #endif
}
