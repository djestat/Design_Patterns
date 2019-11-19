//
//  Proxy.swift
//  homeWork_1
//
//  Created by Igor on 17.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

class AlamofireServiceProxy {
    
    static let instance = AlamofireServiceProxy()
    let alamofireService = AlamofireService()
    
    func getFriends(delegate: VkApiFriendsDelegate) {
        self.alamofireService.getFriends(delegate: delegate)
        print("Proxy log - called function: getFriends")
    }

    func getGroups(delegate: VkApiGroupsDelegate) {
        self.alamofireService.getGroups(delegate: delegate)
        print("Proxy log - called function: getGroups")
    }

    func leaveGroup(gid: Int, delegate: VkApiGroupsDelegate) {
        self.alamofireService.leaveGroup(gid: gid, delegate: delegate)
        print("Proxy log - called function: leaveGroup")
    }
    
    func joinGroup(gid: Int, delegate: VkApiGroupsDelegate) {
        self.alamofireService.joinGroup(gid: gid, delegate: delegate)
        print("Proxy log - called function: joinGroup")
    }
    
    func searchGroups(search: String, delegate: VkApiGroupsDelegate) {
        self.alamofireService.searchGroups(search: search, delegate: delegate)
        print("Proxy log - called function: searchGroups")
    }
    
    func getPhotos(delegate: VkApiPhotosDelegate) {
        self.alamofireService.getPhotos(delegate: delegate)
        print("Proxy log - called function: getPhotos")
    }
    
    func getPhotosBy(_ id: Int, delegate: VkApiPhotosDelegate) {
        self.alamofireService.getPhotosBy(id, delegate: delegate)
        print("Proxy log - called function: getPhotosBy")
    }
    
    func getNews(startFrom: String, delegate: VkApiFeedsDelegate) {
        self.alamofireService.getNews(startFrom: startFrom, delegate: delegate)
        print("Proxy log - called function: getNews")
    }
    
    func getComments(ownerId: Int, postId: Int, delegate: VkApiCommentsDelegate) {
        self.alamofireService.getComments(ownerId: ownerId, postId: postId, delegate: delegate)
        print("Proxy log - called function: getComments")
    }
    
}
