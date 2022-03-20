//
//  TweetDetailViewModel.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 20/3/22.
//

import Foundation
import MapKit

final class TweetDetailViewModel {
    
    let user: User
    let tweet: Tweet
    
    required init(with tweet: Tweet, user: User) {
        self.tweet = tweet
        self.user = user
    }
    
    var name: String {
        return user.name ?? ""
    }
    
    var avatarUrl: String {
        return user.avatar ?? ""
    }
    
    var text: String {
        return tweet.text ?? ""
    }
    
    var location: String {
        return user.location ?? ""
    }
    
    var followersCount: String {
        return String(user.publicMetrics?.followersCount ?? 0)
    }
    
    var tweetCount: String {
        return String(user.publicMetrics?.tweetCount ?? 0)
    }
    
    var favouriteCount: String {
        return String(tweet.publicMetrics?.likeCount ?? 0)
    }
    
    var retweetCount: String {
        return String(tweet.publicMetrics?.retweetCount ?? 0)
    }
    
    var replyCount: String {
        return String(tweet.publicMetrics?.replyCount ?? 0)
    }
    
    var geolocation: CLLocationCoordinate2D {
        guard let coordinates = tweet.geo?.coordinates else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: coordinates[0], longitude: coordinates[1])
    }
    
    var hasGeolocation: Bool {
        return tweet.geo != nil
    }
}
