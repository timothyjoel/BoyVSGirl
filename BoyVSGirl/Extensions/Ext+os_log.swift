//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import os.log
import UIKit

extension OSLog {
    
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs related to view cycle
    static let viewCycle = OSLog(subsystem: subsystem, category: "ViewCycle")
    /// Logs related to data management processes - CRUD
    static let coreData = OSLog(subsystem: subsystem, category: "CoreData")
    
}
