//
//  UserListView.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//

import SwiftUI

struct UserListView: View {
  // must pass UserViewModel (cannot create itself to allow for dependency injection)
  @ObservedObject var viewModel: UserViewModel

  var body: some View {
    List(viewModel.users) { user in
      UserListRowView(user: user)
    }
  }
}

#Preview {
  // uses mock data to preview the view, because preview should not make network requests
  UserListView(viewModel: UserViewModel(userService: UserServiceMock()))
}
