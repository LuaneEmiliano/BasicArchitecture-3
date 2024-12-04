//
//  BasicArchitectureApp.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//

import SwiftUI

@main
struct BasicArchitectureApp: App {
  // uses real service to fetch data
  @StateObject var viewModel = UserViewModel(userService: UserService())
  
  var body: some Scene {
    WindowGroup {
      UserListView(viewModel: viewModel)
    }
  }
}
