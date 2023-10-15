import Foundation

func triggerZappieWebhook(withURL webhookURLString: String, completion: @escaping (Bool, Error?) -> Void) {
    guard let webhookURL = URL(string: webhookURLString) else {
        completion(false, NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
        return
    }
    
    var request = URLRequest(url: webhookURL)
    request.httpMethod = "POST"
    // If the webhook expects specific data, set it here:
    // request.httpBody = ...

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(false, error)
        } else if let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode {
            completion(true, nil)
        } else {
            let error = NSError(domain: "", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: [NSLocalizedDescriptionKey: "Webhook triggered with non-success status"])
            completion(false, error)
        }
    }
    task.resume()
}
