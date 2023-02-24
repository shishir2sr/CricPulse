import Foundation
import CoreData

class CoreDataHelper{
    static let shared = CoreDataHelper()
    private init(){}
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
    func fetchPlayers() async -> [CDPlayer]?{
        do {
            let request = NSFetchRequest<CDPlayer>(entityName: "CDPlayer")
            return try context.fetch(request)
        }
        catch {
            print(error)
        }
        return nil
    }
    
    // Save Players to coredata
    func savePlayers(players: [PlayerDataClass])async{
        let playersArray = players.compactMap { player -> [String: Any]? in
            guard let id = player.id, let name = player.fullname, let image = player.image_path else {
                return nil
            }
            return ["id": Int32(id), "name": name, "image_path": image]
        }
        let batchInsert = NSBatchInsertRequest(entity: CDPlayer.entity(), objects: playersArray)
        do {
            let result = try context.execute(batchInsert) as? NSBatchInsertResult
        } catch {
            print(error)
        }
        
    }
    
    ///  Search Players
    func searchPlayerbyName(with searchText: String) -> [CDPlayer] {
        let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<CDPlayer> = CDPlayer.fetchRequest()
        if !searchText.isEmpty {
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchText)
        }

        do {
            let players = try context.fetch(fetchRequest)
            return players
        } catch let error {
            print("Error fetching players: \(error)")
            return []
        }
    }
}
