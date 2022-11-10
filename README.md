## How to Use the Demo App
Simply search for the comments marked as "TODO" throughout the demo app.

### Initialization
First, add your `.pem` file to the project as described in the [integrator documentation](https://venuenext.github.io/ios-2/quick-start-guide/). Then, find the following TODO's in the `AppDelegate.swift` file and adjust the values accordingly:

```swift
/*
 TODO: Before the VN SDK can be used, it must be initialized.
 The `org`, `instance`, and env must be correct. You should receive these values from the VenueNext team. `env` is optional. Omit `env` to point to your production environment, or include it to point to other environments, like "qa" or "dev" (the environment must be created by VN, however).
 */
VenueNextWeb.shared.initialize("<YOUR_VN_ORG>", instance: "<YOU_VN_INSTANCE>")
```

```swift
/*
 TODO: A .pem file is needed for authenticating user.
 If you are planning on allowing users to log in with external accounts, the .pem file must be set. The .pem file should be received from the VenueNext team. You will need to import your .pem file to Xcode.
 */
if let filePath = Bundle.main.path(forResource: "<YOUR_PEM_FILE_NAME>", ofType: "pem") {
  let fileURL = URL(fileURLWithPath: filePath)
  VenueNextWeb.shared.privateKeyPath = fileURL
}
```

You can demo using a custom theme by updating the contents of the `VNCustomTheme.swift` file, or simply set the theme using the base theme available from the SDK.

Custom theme:
```swift
/*
 TODO: A theme should also be configured before presenting SDK views.
 You can use the default them (VNBaseTheme), or create a custom theme by conforming to the VNThemable protocol. Experiment with custom theming by editing the VNDemoCustomTheme class.
 */
VenueNextWeb.shared.configureTheme(VNDemoCustomTheme())
```

Base theme:
```swift
/*
 TODO: A theme should also be configured before presenting SDK views.
 You can use the default them (VNBaseTheme), or create a custom theme by conforming to the VNThemable protocol. Experiment with custom theming by editing the VNDemoCustomTheme class.
 */
VenueNextWeb.shared.configureTheme(VNBaseTheme())
```

### Ticketing
Use the contrived ticketing example as is, or replace the `VNDemoTicketingAPI.swift` file with your own ticketing integration.
```swift
/*
 TODO: This is a contrived example of a ticketing integration.
 For best results, please test with your own ticketing integration.

 *** DISCLOSURE ***
 Using this fake demo api will create this user in your org.
 */

...

class VNDemoTicketingAPI {...}
```

Remember, it is the integrator's responsibility to track the status of external logins. If an external ticketing library is being used, and the login persists through several app sessions, the integrator should check the status of that logged in user and pass user data to the VN SDK when appropriate before launching VN flows.

```swift
/*
 TODO: The user must be set with each app launch.
 VN does not save the login. If a user is already logged in to your app, don't forget set the VN User. You can experiment with this fake user and contrived ticketing API, or implement your own ticketing integration here.
 > Note: See "External login providers" in the VN SDK documentation for more info on supported providers.
 > https://venuenext.github.io/ios-2/quick-start-guide/
 */
VNDemoTicketingAPI().getDemoUser { demoUser in
  if let demoUser = demoUser {
    let vnUser = User(
      demoUser.userID,
      email: demoUser.email,
      firstName: demoUser.firstName,
      lastName: demoUser.lastName,
      phoneNumber: demoUser.phoneNumber,
      provider: nil
    )
    VenueNextWeb.shared.setUser(vnUser)
  }
}
```

### Ordering and Wallet Methods
To test the ordering and wallet flows, you may need to plug in values to the VN SDK calls in the `func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)` methods (in both the `VNDemoOrderingViewController.swift` and `VNDemoWalletViewController.swift` files) with values from your own organization (that match up with the `.pem` file being used) to properly demo full functionality.
