//
//  Protocols.swift
//  CarelonEngage_iOS
//
//  Created by Rishop Babu on 05/08/25.
//

import Foundation

// MARK: - Protocol constraints for generic Segments

protocol SegmentProtocol: Hashable, CaseIterable, Identifiable & RawRepresentable where RawValue == String {}
