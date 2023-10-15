//
//  HomeView.swift
//  SelfActualize
//
//  Created by Scott Ho on 10/14/23.
//

import SwiftUI
import WebKit

struct ChatView: View {
    var person: Person?

    @State private var aboutme: String = ""
    @State private var goals: String = ""

    var body: some View {
        

        VStack(alignment: .leading) {
            
            WebView(url: URL(string: "https://docs.google.com/forms/d/e/1FAIpQLScGCqCKbONW2mZCw2qkvIEa6gajhGCzXRXtnC_iyrsb6cxrjQ/viewform")!)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.6)
            Spacer()  // Pushes WebView to occupy the top 70% of the screen

            ActionButton(iconName: "pencil.circle.fill", title: "Start SMS conversation") {
                // Handle button tap here
                openMessagesApp()
//                trigger web hook here?
                
            }
            
            ActionButton(iconName: "play.circle.fill", title: "Watch a video from your hero") {
                // Handle button tap here
            }

            ActionButton(iconName: "music.note", title: "Listen to audio from your hero") {
                // Handle button tap here
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) // Hides the default back button

        .padding()
        .onTapGesture {  // Added tap gesture to dismiss keyboard
            dismissKeyboard()
        }
        
        
        

    }
    
    // Function to dismiss the keyboard
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    func openMessagesApp() {
        if let url = URL(string: "sms:14156505030") {  // Just opens the Messages app
            // You can specify a number like this: URL(string: "sms:1234567890")
            UIApplication.shared.open(url)
        }
    }
    
    func triggerWebHook() {
        let webhookURLString = "https://hooks.zapier.com/hooks/catch/16771341/3sg7u2l?phone=14158672648"
        triggerZappieWebhook(withURL: webhookURLString) { (success, error) in
            if success {
                print("Webhook triggered successfully!")
            } else {
                print("Error triggering webhook: \(error?.localizedDescription ?? "Unknown error")")
            }
        }

    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct PillShapeTextView: View {
    var title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .padding(.horizontal, 16)  // Horizontal padding to make it more pill-like
            .padding(.vertical, 8)     // Vertical padding for height
            .background(Color.red)    // Background color
            .foregroundColor(.white)   // Text color
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5) // Shadow effect
    }
}


