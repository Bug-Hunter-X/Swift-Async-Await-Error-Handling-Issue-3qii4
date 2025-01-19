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
        print("Error: \(error)")
    }
}