import Foundation
import CoreData


extension CDPlayer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPlayer> {
        return NSFetchRequest<CDPlayer>(entityName: "CDPlayer")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image_path: String?

}

extension CDPlayer : Identifiable {

}
