import Foundation

extension DateFormatter {
    class func private_new() -> DateFormatter {
        let fmt = DateFormatter.init()
        fmt.dateFormat = "HH:mm:ss.sss"
        return fmt
    }
}

private let formatter = DateFormatter.private_new()

public func DTLog(_ format: String, _ args: CVarArg..., file : String = #file, line : UInt = #line) {
    #if DEBUG
        DTLog("\(Thread.isMainThread ? "[Main]" : "[Child]")\((file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: ""))[\(line)][\(formatter.string(from: Date.init()))]:\(String.init(format: format, arguments: args))")
    #endif
}
