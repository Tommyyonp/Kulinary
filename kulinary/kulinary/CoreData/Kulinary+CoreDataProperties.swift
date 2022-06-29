//
//  Kulinary+CoreDataProperties.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 26/06/22.
//

import Foundation
import CoreData

extension Kulinary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kulinary> {
        return NSFetchRequest<Kulinary>(entityName: "Kulinary")
    }

    @NSManaged public var namaRestoran: String?
    @NSManaged public var deskripsi: String?
    @NSManaged public var rating: NSDecimalNumber?
    @NSManaged public var menuAndalan: String?

}


