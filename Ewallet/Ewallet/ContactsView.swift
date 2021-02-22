//
//  ContactsView.swift
//  Ewallet
//
//  Created by Khirzeri on 14/09/2020.
//  Copyright © 2020 Balaji. All rights reserved.
//
import UIKit
import Contacts

final class ContactsView: ObservableObject {
    
    @Published
    var contacts: [Contacts] = []
    @Published
    var permissionsError: PermissionsError? = .none
    
    init() {
        permissions()
    }
    
    func openSettings() {
        permissionsError = .none
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {return}
        if UIApplication.shared.canOpenURL(settingsURL) {UIApplication.shared.open(settingsURL)}
    }
    
    
    private func getContacts() {
        Contacts.fetchAll { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let fetchedContacts):
                DispatchQueue.main.async {
                    self.contacts = fetchedContacts.sorted(by: { $0.lastname < $1.lastname})
                }
            case .failure(let error):
                self.permissionsError = .fetchError(error)
            }
        }
    }
    
    private func permissions() {
        switch CNContactStore.authorizationStatus(for: .contacts) {
        case .authorized:
            getContacts()
        case .notDetermined, .restricted,.denied:
            CNContactStore().requestAccess(for: .contacts) { granted, error in
                //guard let self = self else {return}
                switch granted {
                case true:
                    self.getContacts()
                case false:
                    DispatchQueue.main.async {
                        self.permissionsError = .userError
                    }
                }
            }
        default:
            fatalError("Unknown Error!")
        }
    }
}
