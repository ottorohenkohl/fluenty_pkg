import SwiftSyntax
import FluentKit
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import Macro

final class MacroTest: XCTestCase {
    @Entity
    final class TestEntity: Model, @unchecked Sendable {}
    
    func test() throws {
        XCTAssertEqual(TestEntity.schema, "TestEntity")
    }
}
