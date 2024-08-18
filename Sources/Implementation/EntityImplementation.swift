import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct EntityImplementation: MemberMacro {
    public static func expansion(of: AttributeSyntax, providingMembersOf: some DeclGroupSyntax, in: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard let named = providingMembersOf.as(ClassDeclSyntax.self) else {
            throw MacroExpansionErrorMessage("Macro can only be applied to class types")
        }
        
        return [
            "static let schema = \"\(raw: named.name.text)\"",
            "typealias IDValue = UUID",
            "@ID(key: .id)",
            "var id: UUID?"
        ]
    }
}

@main
struct Plugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [EntityImplementation.self]
}
