import Foundation
import Realm
import RealmSwift

class User: Object {
    
    // Properties
    @objc dynamic var username: String = ""
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var bio: String = ""
    var profileImage: UIImage?
    var vehicles: List<Vehicle> = List<Vehicle>()
    @objc dynamic var defaultVehicle: Vehicle?
    var ratings: List<Rating> = List<Rating>()
    
    //Initializers
   convenience init?(username: String,firstname: String, lastname: String, email: String){
        self.init()
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.vehicles = List<Vehicle>()
        self.ratings = List<Rating>()
    }
    

    override static func primaryKey() -> String?{
        return "username"
    }
    
    func addVehicle(name: String, vehicle: Vehicle) -> Bool{
        if self.vehicles.value(forKey: name) == nil{
            vehicles.append(vehicle)
            return true
        }
        return false
    }
    
    
    //returns default vehicle if one exists
    func getDefaultVehicle() -> Vehicle?{
        for v in self.vehicles{
            if v.isDefault == true{
                return v
            }
        }
        return nil
    }
    
    //sets default vehicle and and returns vehicle object
    func setDefaultVehicle(vehicle: Vehicle) -> Vehicle?{
        for v in self.vehicles{
            if v == vehicle{
                v.isDefault = true
                return v
            }
        }
        return nil
    }
}
