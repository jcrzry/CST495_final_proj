import Foundation
import Realm
import RealmSwift

class User: Object {
    
    // Properties
   // @objc dynamic var username: String = ""
    @objc dynamic var firstname: String = ""
    @objc dynamic var lastname: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var defaultLocation: Locations?
    @objc dynamic var profileImage: NSData?
    var vehicles: List<Vehicle> = List<Vehicle>()
    @objc dynamic var defaultVehicle: Vehicle?
    var ratings: List<Rating> = List<Rating>()
    var rides: List<Ride> = List<Ride>()
    @objc dynamic var simpleUser: SimpleUser?
    
    
    //Initializers
    convenience init?(firstname: String, lastname: String, email: String,password: String, phone: String){
        self.init()
        //self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.phone = phone
        self.vehicles = List<Vehicle>()
        self.ratings = List<Rating>()
        self.rides = List<Ride>()
        //self.token = token
    }
    
    override static func primaryKey() -> String?{
        return "email"
    }
    
    func addVehicle(vehicle: Vehicle){
       self.vehicles.append(vehicle)
    }
    func removeVehicle(vehicle: Vehicle){
        self.vehicles.remove(at: self.vehicles.index(of:vehicle)!)
    }
    //returns default vehicle if one exists
    func getDefaultVehicle() -> Vehicle?{
        return self.defaultVehicle
    }
    
    //sets default vehicle and and returns vehicle object
    func setDefaultVehicle(vehicle: Vehicle){
       self.defaultVehicle = vehicle
    }
    
    func setUserImage(uimage: UIImage){
        self.profileImage = UIImagePNGRepresentation(uimage) as NSData?
    }

    func toSimpleUser() -> SimpleUser{
        return SimpleUser(firstname: self.firstname, lastname: self.lastname, email: self.email, bio: self.bio, profileImage: self.profileImage!, defaultVehicle: self.defaultVehicle!)!
    }
}
