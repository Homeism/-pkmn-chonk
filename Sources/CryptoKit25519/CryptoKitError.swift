//
//  CryptoKitError.swift
//  CCurve25519
//
//  Created by Christoph on 13.01.20.
//

import Foundation

/// General CryptoKit errors.
public enum CryptoKitError: Error {
    
    case incorrectParameterSize
    
    /// The key material has invalid length
    case invalidKeyLength
    
    /// The key agreement could not be completed.
    case keyAgreementFailed
    
    /// The derivation of a symmetric key could not be completed.
    case keyDerivationFailed
    
    /// The source for randomness was not set (`Randomness.source`)
    case noRandomn