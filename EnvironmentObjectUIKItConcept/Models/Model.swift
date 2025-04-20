//
//  Model.swift
//  EnvironmentObjectUIKItConcept
//
//  Created by Kacper Marciszewski on 20/04/2025.
//
import Foundation
import Combine

class UserSettings: ObservableObject{
    @Published var isAuthenticated = false
    
    var authenticationString: String {
        if isAuthenticated {
            return "Logged in"
        }else {
            return "Not logged in"
        }
    }
}
class AppSettings: ObservableObject {
    @Published var language = "English "
}

class Environment{
    static let updateChanged = Notification.Name("EnvironmentChangedUpdate")
    static let shared = Environment()
    
    private var sinks = [AnyCancellable]()
    var values = [Any]()
    
    private init() {
        
    }
    func register<T: ObservableObject>(_ value: T) {
        values.append(value)
        
        let sink = value.objectWillChange.sink {  _ in
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Self.updateChanged, object: value)
            }
        }
        sinks.append(sink)
    }
    
}

protocol GlobalUpdating {
    func update()
    
}
extension GlobalUpdating {
    func registerForUpdates() {
        
    }
}

struct Global<ObjectType: ObservableObject> {
    var wrappedValue: ObjectType
    
    init() {
        if let value = Environment.shared.values.first(where: { $0 is ObjectType}) as? ObjectType {
            self.wrappedValue = value
        }else {
            fatalError("Missing type in environment")
        }
    }
}
