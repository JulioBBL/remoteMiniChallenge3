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

    func getNotificationRequisitor (forNotificationAt index: Int) -> String {
		return notifications[index].requisitor
    }
	
	func getNotificationProjectRequired (forNotificationAt index: Int) -> String {
		return notifications[index].projectRequired
    }

    func getNotificationPerson (forNotificationAt index: Int) -> String {
        return notifications[index].personImage
    }
	
	func getNotification (forNotificationAt index: Int) -> Notification {
        return notifications[index]
    }
	
	func setNotifications () {
		//TODO: Pegar os dados so servidor
		notifications.append(Notification(personImage: "cas",
										  projectRequired: "Projetounc getNotificationPerson (forNotificationAt index: Int) -> String unc getNotificationPerson (forNotificationAt index: Int) -> String ",
										  requisitor: "Projetounc getNotificationPerson (forNotificationAt index: Int) -> String unc getNotificationPerson (forNotificationAt index: Int) -> String ", requisitorEmail: "cassia.a.barbosa@gmailProjetounc getNotificationPerson (forNotificationAt index: Int) -> String unc getNotificationPerson (forNotificationAt index: Int) -> String com"))
	}
}
