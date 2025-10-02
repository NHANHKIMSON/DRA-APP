//
//  User.swift
//  EasyCheck App
//
//  Created by Apple on 10/1/25.
//


struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}