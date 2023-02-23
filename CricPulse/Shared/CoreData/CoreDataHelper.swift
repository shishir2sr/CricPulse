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
    
    
    /**
     //        var playersArray = [[String: Any]]()
     //        for player in players {
     //            if let id = player.id,
     //               let name = player.fullname,
     //               let image = player.image_path {
     //                let playersDictionary: [String: Any] = ["id": Int32(id), "name": name, "image_path": image]
     //                playersArray.append(playersDictionary)
     //            }
     //        }
     //    }
     */
}
