func fetchData() async throws -> Data {
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw URLError(.badServerResponse)
    }
    return data
}

Task { 
    do {
        let data = try await fetchData()
        // Process data
    } catch {
        // Handle the error appropriately
        if let urlError = error as? URLError {
            switch urlError.code {
            case .badServerResponse: print("Server responded with error")
            case .notConnectedToInternet: print("No internet connection")
            default: print("Unknown network error")
            }
        } else {
            print("An unknown error occurred: \(error)")
        }
    }
} 