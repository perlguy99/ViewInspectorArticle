//
//  TestableView.swift
//  ViewInspectorArticle
//
//  Created by Brent Michalski on 7/31/24.
//

import SwiftUI

protocol ViewInspectorHook {
    var viewInspectorHook: ((Self) -> Void)? { get set }
}

typealias TestableView = View & ViewInspectorHook
