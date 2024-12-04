//
//  UserListRowView.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/19/24.
//

import SwiftUI

struct UserListRowView: View {
  let user: User

  var body: some View {
    VStack(alignment: .leading) {
      Text(user.name ?? "")
        .font(.headline)
      Text(user.email ?? "")
        .font(.subheadline)
    }
  }
}
