//
//  UserService.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//
// https://jsonplaceholder.typicode.com/users

import Foundation

// Conforms to BaseNetwork so we can use fetch(url: URL) method from parent class
internal class UserService: BaseNetwork, UserServiceProtocol {
  func fetchUsers() async throws  -> [User] {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { throw NetworkError.invalidUrl }
    return try await fetch(url: url)
  }
}
