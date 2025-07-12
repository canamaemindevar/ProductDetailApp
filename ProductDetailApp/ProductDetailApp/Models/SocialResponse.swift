//
//  SocialResponse.swift
//  ProductDetailApp
//
//  Created by Emincan Antalyalı on 12.07.2025.
//
import Foundation

struct SocialResponse: Decodable {
    let likeCount: Int
    let commentCounts: CommentCounts
}

struct CommentCounts: Decodable {
    let averageRating, anonymousCommentsCount, memberCommentsCount: Int
}

