//
//  UserViewModel.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//

import Foundation

@MainActor
internal class UserViewModel: ObservableObject {
  @Published var users = [User]() // starts empty, and updates when users are fetched
  let userService: UserServiceProtocol // must pass UserService

  // Must pass UserServiceProtocol, which allows for dependency injection
  init(userService: UserServiceProtocol) {
    self.userService = userService
    getUsers()
  }

  // Runs at init to fetch users
  private func getUsers() {
    Task {
      do {
        users = try await userService.fetchUsers()
      } catch {
        print("Error: \(error)")
      }
    }
  }
}
