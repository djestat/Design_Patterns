import UIKit

func data(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

let data1 = data(from: "1")
let data2 = data(from: "2")
let data3 = data(from: "3")


//MARK: - Release

enum DataDictionary {
    case data
}

enum ResultDictionary {
    case result
}

enum Array {
    case dictionary
}

class Person: Codable {
    var name: String
    var age: Int
    var isDeveloper: Bool
    
    init(name: String, age: Int, isDeveloper: Bool) {
        self.name = name
        self.age = age
        self.isDeveloper = isDeveloper
    }
}

func parseData(_ data: Data, completion: @escaping (Error?) -> Void) -> [Person] {
    
    return []
}



// Need DELETE


enum LoginError: Error {
    case loginDoesNotExist
    case wrongPassword
    case smsCodeInvalid
}

enum NetworkError: Error {
    case noConnection
    case serverNotResponding
}

enum GeneralError: Error {
    case sessionInvalid
    case versionIsNotSupported
    case general
}

func requestData(completion: @escaping (Error?) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        completion(GeneralError.sessionInvalid)
    })
}

protocol ErrorHandler {
    
    var next: ErrorHandler? { get set }
    
    func handleError(_ error: Error)
}

class LoginErrorHandler: ErrorHandler {
    
    var next: ErrorHandler?
    
    func handleError(_ error: Error) {
        guard let loginError = error as? LoginError else {
            self.next?.handleError(error)
            return
        }
        print(loginError)
        // show tooltip
    }
}

class NetworkErrorHandler: ErrorHandler {
    
    var next: ErrorHandler?
    
    func handleError(_ error: Error) {
        guard let networkError = error as? NetworkError else {
            self.next?.handleError(error)
            return
        }
        print(networkError)
        // show alert
        // try repeat network request
    }
}

class GeneralErrorHandler: ErrorHandler {
    
    var next: ErrorHandler?
    
    func handleError(_ error: Error) {
        guard let generalError = error as? GeneralError else {
            self.next?.handleError(error)
            return
        }
        print(generalError)
        // show error view controller
        // try repeat request
        // log error
    }
}


let loginErrorHandler = LoginErrorHandler()
let networkErrorHandler = NetworkErrorHandler()
let generalErrorHandler = GeneralErrorHandler()
let errorHandler: ErrorHandler = loginErrorHandler

loginErrorHandler.next = networkErrorHandler
networkErrorHandler.next = generalErrorHandler
generalErrorHandler.next = nil

requestData { error in
    if let error = error {
        errorHandler.handleError(error)
    }
}
