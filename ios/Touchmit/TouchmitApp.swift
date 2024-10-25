//
//  TouchmitApp.swift
//  Touchmit
//
//  Created by Qin Chingis on 10/25/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
// Функция для добавления пользователя в Firestore
func addUserToFirestore(userId: String, passwordHash: String) {
    // Ссылка на Firestore
    let db = Firestore.firestore()
    
    // Коллекция "User", куда мы добавим данные
    let userCollection = db.collection("User")
    
    // Данные для нового документа
    let newUser: [String: Any] = [
        "userId": userId,
        "passwordHash": passwordHash
    ]
    
    // Добавляем документ с указанным userId как идентификатором документа
    userCollection.document(userId).setData(newUser) { error in
        if let error = error {
            print("Ошибка при добавлении пользователя: \(error.localizedDescription)")
        } else {
            print("Пользователь успешно добавлен в Firestore!")
        }
    }
}

// Пример вызова функции
addUserToFirestore(userId: "user123", passwordHash: "hashed_password")

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}




@main
struct Touchmit: App {
    // Register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
