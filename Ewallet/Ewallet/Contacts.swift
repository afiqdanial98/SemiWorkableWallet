//
//  Contacts.swift
//  Ewallet
//
//  Created by Khirzeri on 14/09/2020.
//  Copyright © 2020 Balaji. All rights reserved.
//

import Contacts

struct Contacts: Identifiable{
    var id: String{ contact.identifier }
    var firstname: String { contact.givenName }
    var lastname: String { contact.familyName }
    var phone: String? { contact.phoneNumbers.map(\.value).first?.stringValue }
    let contact: CNContact
    
    static func fetchAll(_ completion: @escaping(Result<[Contacts], Error>) -> Void) {
        let containerID = CNContactStore().defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerID)
        let descriptor =
            [
                CNContactIdentifierKey,
                CNContactGivenNameKey,
                CNContactFamilyNameKey,
                CNContactPhoneNumbersKey
            ]
        as [CNKeyDescriptor]
        do {
            let rawContacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: descriptor)
            completion(.success(rawContacts.map { .init(contact: $0)}))
        } catch {
            completion (.failure(error))
        }
    }
}



enum PermissionsError: Identifiable{
    var id: String { UUID().uuidString }
    case userError
    case fetchError(_: Error)
    var description: String {
        switch self {
        case .userError:
            return "Please check settings"
        case .fetchError(let error):
            return error.localizedDescription
        }
    }
}
