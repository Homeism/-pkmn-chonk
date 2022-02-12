//
//  Randomness.swift
//  CCurve25519
//
//  Created by Christoph on 13.01.20.
//
#if os(Linux)
import SwiftGlibc
#else
import Foundation
#endif

public enum Randomness {
    
    /**
    The external source of randomness.
     
     - Note: This source must only be set if `SecRandomCopyBytes` is unavailable.
     It is available on the following platforms:
     iOS 2.0+, macOS 10.7+, tvOS 9.0+, watchOS 2.0+, Mac Catalyst 13.0+
  