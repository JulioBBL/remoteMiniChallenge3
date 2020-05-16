//
//  NotificationViewModel.swift
//  RemoteMC3
//
//  Created by Luiza Fattori on 14/05/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class NotificationViewModel {
    var notifications: [Notification] = []
    var requestsNotification: [RequestNotification] = []

    func getNotificationsRowsNumber() -> Int {
        return notifications.count
    }

    func getNotificationMensage (forNotificationAt index: Int) -> String {
        return notifications[index].mensage
    }

    func getNotificationPerson (forNotificationAt index: Int) -> UIImage {
        return notifications[index].personImage
    }
}
