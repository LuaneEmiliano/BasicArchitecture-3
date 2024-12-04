//
//  UserServiceProtocol.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/19/24.
//

internal protocol UserServiceProtocol {
  func fetchUsers() async throws -> [User]
}
