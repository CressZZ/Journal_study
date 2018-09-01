//
//  RealmEntryRepository.swift
//  Journal
//
//  Created by JinSeo Yoon on 2018. 9. 1..
//  Copyright © 2018년 Jinseo Yoon. All rights reserved.
//

import Foundation
import Firebase

class FirebaseEntryRepository: EntryRepository {
    private let reference: DatabaseReference
    init(reference: DatabaseReference = Database.database().reference()) {
        self.reference = reference.child("entries")
    }
    
    
    func update(_ entry: EntryType, text: String) {
        
    }
    
    var numberOfEntries: Int { return 0 }
    
    func add(_ entry: EntryType) {
        guard let entry = entry as? Entry else { fatalError() }
        reference.child(entry.id.uuidString).setValue(entry.toDitionary())
    }

    func update(_ entry: EntryType) { }
    func remove(_ entry: EntryType) { }
    func entries(contains string: String) -> [EntryType] {
        return []
    }
    func entry(with id: UUID) -> EntryType? {
        return nil
    }
    func recentEntries(max: Int, completion: @escaping ([EntryType]) -> Void) {
        self.reference
        .observeSingleEvent(of: .value, with: { (snapshot) in
            completion([])
            })
    }
    
    
}
