//
//  ConnectionManager.swift
//  FoxSport Demo
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation

enum JSONError: String, Error {
    case noData = "ERROR: No data"
    case conversionFailed = "ERROR: conversion from JSON failed"
}


struct ConnectionManager {
    static let dataBaseUrl = "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayerstats.json"
    static let userkey = "A00239D3-45F6-4A0A-810C-54A347F144C2"

    static func getData(types: [StatType] = StatType.allValues, completion: @escaping (_ matches: [Match], _ errorMessage: String)->()) {
        guard let url =  types.toBaseUrl() else {
            completion([], "Error creating url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {throw JSONError.noData}
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let jsonSearchResults  = try? decoder.decode([Match].self, from: data) else {throw JSONError.conversionFailed}
                DispatchQueue.main.async {completion(jsonSearchResults, "")}
            } catch let error as JSONError {
                DispatchQueue.main.async {completion([], error.rawValue)}
            } catch let error as NSError {
                DispatchQueue.main.async {completion([], error.debugDescription)}
            }
            }.resume()
    }
}
