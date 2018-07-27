//
//  FoxSport_DemoTests.swift
//  FoxSport DemoTests
//
//  Created by Dmitrii Zverev on 27/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import XCTest
@testable import FoxSport_Demo

class FoxSport_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    func testUrlCreating()  {
       let exampleUrl =  "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2"
       let createdUrl = [StatType.fantasyPoints, .tackles, .runs, .runMetres].toBaseUrl()
        XCTAssertNotNil(createdUrl, "createdUrl should not be nil")
        XCTAssertEqual(exampleUrl, createdUrl!.absoluteString, "created Url URL should be equal to example URL")
    }
    
    func testAsynchronousURLConnection() {
        let url = StatType.allValues.toBaseUrl()!
        let urlExpectation = expectation(description: "GET \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let response = response as? HTTPURLResponse,
                let responseURL = response.url,
                let mimeType = response.mimeType
            {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data {
                    XCTAssertNotNil(try? decoder.decode([Match].self, from: data), "SearchResults JOSN Decoding error")
                }
                XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(response.statusCode, 200, "HTTP response status code should be 200")
                XCTAssertEqual(mimeType, "application/json", "HTTP response content type should be application/json")
            } else {
                XCTFail("Response was not HTTPURLResponse")
            }
            
            urlExpectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
    
}
