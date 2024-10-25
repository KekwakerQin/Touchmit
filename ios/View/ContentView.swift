//
//  ContentView.swift
//  Touchmit
//
//  Created by Qin Chingis on 10/25/24.
//

import SwiftUI
import FirebaseFirestore
struct ContentView: View {
    // Ссылка на базу данных Firestore
    let db = Firestore.firestore()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("1,s 2!")

            // Кнопка для добавления данных в Firestore
            Button(action: {
                addUser()
            }) {
                Text("Добавить пользователя")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }

    func addUser() {
        // Тестовые данные для пользователя
        let userData: [String: Any] = [
            "userId": "user123",
            "username": "testuser",
            "email": "testuser@example.com",
            "passwordHash": "hashed_password",
            "profilePicture": "https://example.com/profile.jpg",
            "bio": "This is a test user.",
            "dateOfRegistered": Timestamp(date: Date()),
            "notificationPreferences": ["email": true, "push": false],
            "themePreference": "dark",
            "showOnlineStatus": true,
            "friendRequestsSentIds": ["user456", "user789"],
            "friendRequestsReceivedIds": ["user321", "user654"],
            "blockedUsersIds": ["user111"],
            "lastOnlineTime": Timestamp(date: Date()),
            "phone": "+1234567890",
            "contactsUsersIds": ["user456", "user789"],
            "location": GeoPoint(latitude: 37.7749, longitude: -122.4194)
        ]

        // Добавляем данные в коллекцию "user"
        db.collection("user").document("user123").setData(userData) { error in
            if let error = error {
                print("Ошибка при добавлении данных: \(error)")
            } else {
                print("Данные успешно добавлены!")
            }
        }
    }
}
