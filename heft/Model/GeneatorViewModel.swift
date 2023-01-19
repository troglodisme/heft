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
    
    //add to gitignore
    let apiKey = "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"
    
    
    let model = "text-davinci-003"
    let prompt = "Write a formal birthday card message for Tim Cook who is 62 today."
    let temperature = 0.9
    let max_tokens = 200
        
    let decoder = JSONDecoder()
    
    var urlComponents = URLComponents(string: "https://api.openai.com")!
    
    
    func getBirthdayMessage() async {
                
        urlComponents.path = "/v1/completions"
        
        let requestBody = GPT3Request(model: model,
                                      prompt: prompt,
                                      temperature: temperature,
                                      max_tokens: max_tokens)
        
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
            
            // print(String(data: data, encoding: .utf8))
            
            // guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            //Create a variable for the api response and decode it from Json
            let apiResponse = try decoder.decode(GPT3Response.self, from: data)
            
            //We are using the completion API, first choice
            let completion = apiResponse.choices[0].text
            
            print(completion)
            generatedMessage = completion
            
        } catch {
            
            print(error)
            
        }
        
    }
}


    //Struct to decode
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



