# Grading
## Requirements  
- [x] Has a storyboard with 4 meaningful view controllers connected by segues	40
  * LoginViewController
  * FeedCollectionViewController
  * AddRideViewController
  * SeeRideViewController
  * CalculatorViewController
  
- [x] Has Login Screen that authenticates user (does not have to be to server)	5
  * LoginViewController connected with Realm Server
- [ ] Uses GCD for multi-threaded operations	10
- [x] Defines and consumes protocol	5  
  * FeedCellDelegate
- [x] Uses Alert pattern	5  
  * In the LoginViewController `createAlert(title: "Login Failed.", message: "Invalid credentials. Check credentials and try again.")`
- [ ] Uses Action Sheet pattern	5
- [x] Uses animation	10  
  * `provideDeletion()` In the FeedCollectionViewController
  
- [ ] Stores information to user settings	5
- [x] Uses UITableView or UICollectionView to display array of data	10
  * FeedCollectionViewController
- [x] Uses UIScrollView	5
  * Uses ScrollView in the CalculatorViewController

## Extra Credit  
- [x] Uses pods for external libraries	5
  * [ToolBox](https://github.com/JonasDeichelmann/ToolBox)
  * [Realm](http://realm.io)
  * [RealmSwift](http://realm.io)
- [x] Uses server to support application	10
  * [RealmServer](https://realm.io/docs/swift/latest)
- [ ] Uses KeyChain management pod or library for PI data	5
- [x] Implements UITabBarController	5
  * In the Main.storyboard
- [x] Implements UINavigationController	5
  * In the Settings.storyboard
- [ ] Uses AlamoFire for internet connectivity	10
- [ ] Has splash screen	2
- [x] Uses Core Data	15
  * Uses instead Realm localdata to store database
- [ ] Advanced GCD: dispatch groups, semaphores, etc.	10
- [ ] Implements basic internationalization strategy for all labels (not data)	5
- [ ] Allows user settings to be editing using Settings app	5
- [ ] Uses MapKit	5
- [ ] Uses CoreMotion	5
- [x] Uses CoreLocation	5
  * To localize the User in the CalculatorViewController
- [x] Accounts for Keyboard in UIScrollView	5
  * Partly in the CalculatorViewController
- [ ] Uses Camera	5
