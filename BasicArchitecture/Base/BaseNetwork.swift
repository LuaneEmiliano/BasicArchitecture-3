//
//  BaseNetwork.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//

import Foundation
import Combine

internal class BaseNetwork {
  enum NetworkError: Error {
    case noData
    case incorrectServerResponse
    case invalidUrl
    case decodingFailure
  }

  // generic fetch using async await
  func fetch<T: Decodable>(url: URL) async throws -> T {
    let (data, response) = try await URLSession.shared.data(from: url)

    if let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode < 200, httpResonse.statusCode >= 300 {
      throw NetworkError.incorrectServerResponse
    }

    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch {
      throw NetworkError.decodingFailure
    }
  }

  // generic fetch using combine
  func fetch<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: T.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

  // generic fetch using completion handlers
  func fetch<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        completion(.failure(error))
        return
      }

      guard let data = data else {
        completion(.failure(NetworkError.noData))
        return
      }

      do {
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        completion(.success(decodedObject))
      } catch {
        completion(.failure(error))
      }
    }.resume()
  }
}
