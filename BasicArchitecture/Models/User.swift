//
//  User.swift
//  BasicArchitecture
//
//  Created by Sam Hertz on 9/16/24.
//

import Foundation

internal struct User: Decodable, Identifiable {
  let id: Int
  let name: String?
  let username: String?
  let email: String?
  let address: Address?
  let phone: String?
  let website: String?
  let company: Company?
}

internal struct Address: Decodable {
  let street: String?
  let suite: String?
  let city: String?
  let zipCode: String?
  let coordinates: Coordinates?

  init(street: String?, suite: String?, city: String?, zipCode: String?, coordinates: Coordinates?) {
    self.street = street
    self.suite = suite
    self.city = city
    self.zipCode = zipCode
    self.coordinates = coordinates
  }

  enum CodingKeys: String, CodingKey {
    case street
    case suite
    case city
    case zipCode = "zipcode"
    case coordinates = "geo"
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    street = try container.decodeIfPresent(String.self, forKey: .street)
    suite = try container.decodeIfPresent(String.self, forKey: .suite)
    city = try container.decodeIfPresent(String.self, forKey: .city)
    zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
    coordinates = try container.decodeIfPresent(Coordinates.self, forKey: .coordinates)
  }
}

internal struct Coordinates: Decodable {
  let latitude: String?
  let longitude: String?

  init(latitude: String?, longitude: String?) {
    self.latitude = latitude
    self.longitude = longitude
  }

  enum CodingKeys: String, CodingKey {
    case latitude = "lat"
    case longitude = "lng"
  }

  init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude)
    self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude)
  }
}

internal struct Company: Decodable {
  let name: String?
  let catchPhrase: String?
  let bs: String?
}

extension User {
  static let mockAddress = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipCode: "92998-3874", coordinates: Coordinates(latitude: "-37.3159", longitude: "81.1496"))
  static let mockCompany = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real time e-markets")
  static let mockUser = User(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: User.mockAddress, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: User.mockCompany)
}

/*
 {
   "id": 1,
   "name": "Leanne Graham",
   "username": "Bret",
   "email": "Sincere@april.biz",
   "address": {
     "street": "Kulas Light",
     "suite": "Apt. 556",
     "city": "Gwenborough",
     "zipcode": "92998-3874",
     "geo": {
       "lat": "-37.3159",
       "lng": "81.1496"
     }
   },
   "phone": "1-770-736-8031 x56442",
   "website": "hildegard.org",
   "company": {
     "name": "Romaguera-Crona",
     "catchPhrase": "Multi-layered client-server neural-net",
     "bs": "harness real-time e-markets"
   }
 }
 */
