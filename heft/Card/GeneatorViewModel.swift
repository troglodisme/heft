import SwiftUI


struct GPT3Request: Encodable {
    let model: String
    let prompt: String
    let temperature: Double
    let max_tokens: Int
}


@MainActor
class GeneratorViewModel: ObservableObject {

    @Published var generatedMessage: String = ""        
    @Published var wasMessageGenerated: Bool = false
    
    //Import API Key from Secret file
    let apiKey = APIKey.apiKey

    let decoder = JSONDecoder()

    var urlComponents = URLComponents(string: "https://api.openai.com")!

    func getBirthdayMessage(personName: String, personAge: Int, messageType: String) async {

        urlComponents.path = "/v1/completions"

        let requestBody = GPT3Request(model: "text-davinci-003",
                                      prompt: "Write a \(messageType) birthday card message for \(personName) who is \(personAge) today",
                                      temperature: 0.9,
                                      max_tokens: 300)
        
        let url = urlComponents.url
        var request = URLRequest(url: url!)
        
        //Type of request
        request.httpMethod = "POST"
        
        //Api Key
        request.addValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField: "Authorization"
        )
        
        //Header
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        request.httpBody = try! JSONEncoder().encode(requestBody)

        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)

//            print(String(data: data, encoding: .utf8))

            // guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }

            //Create a variable for the api response and decode it from Json
            let apiResponse = try decoder.decode(GPT3Response.self, from: data)

            //We are using the completion API, first choice
            let completion = apiResponse.choices[0].text

            print(completion)
            generatedMessage = completion
            
            wasMessageGenerated = true //set bool to true

        } catch {

            print(error)
            
        }

    }
}



struct GPT3Response: Decodable {
    let id: String
    let object: String
    let created: Int
    let model: String
    let choices: [Choice]
    let usage: Usage
}

struct Choice: Decodable {
    let text: String
    let index: Int
    let logprobs: String?
    let finish_reason: String
}

struct Usage: Decodable {
    let prompt_tokens: Int
    let completion_tokens: Int
    let total_tokens: Int
}



