# [DEPRECATED] CryptoKit25519
A Swift module for Curve25519 functions and AES-GCM encryption compatible with Apple's CryptoKit.

⚠️⚠️⚠️ Now deprecated. Use [swift-crypto](https://github.com/apple/swift-crypto) instead. ⚠️⚠️⚠️

## Purpose

This module provides signatures and key agreement based on Curve25519 in Swift. This library is meant to be compatible and syntactically similar to Apple's [`CryptoKit`](https://developer.apple.com/documentation/cryptokit) framework, which is only available for their recent operating systems. This library provides similar capabilities as [`CryptoKit.Curve25519`](https://developer.apple.com/documentation/cryptokit/curve25519), and has a very similar structure.

## Installation

When using the Swift Package Manager, specify in `Package.swift`:

````swift
.package(url: "https://github.com/christophhagen/CryptoKit25519", from: "0.6.0")
````

Then, in your source files, simply:

````swift
import CryptoKit25519
````

## Usage

This library is built to be *very* similar to Apple's [`CryptoKit`](https://developer.apple.com/documentation/cryptokit) framework, so much of the documentation there also applies to this framework. Notable differences are:
- Operations are NOT constant-time. 
- Sensitive keys are NOT immediately zeroized after use.

Currently supported operations:
- Signatures with Curve2551