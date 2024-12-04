//
//  UserServiceMock.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/19/24.
//

internal class UserServiceMock: UserServiceProtocol {
  func fetchUsers() async throws -> [User] {
    [User.mockUser]
  }
}
