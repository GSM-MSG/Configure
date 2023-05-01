import Foundation

public protocol Configurable {}

public extension Configurable where Self: AnyObject {
    @discardableResult
    @inlinable
    func set<T>(
        _ keyPath: ReferenceWritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @inlinable
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

public extension Configurable where Self: Any {
    @discardableResult
    @inlinable
    mutating func set<T>(
        _ keyPath: WritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    @inlinable
    func then(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }

    @inlinable
    mutating func mutate(_ block: (inout Self) throws -> Void) rethrows {
        try block(&self)
    }

    @inlinable
    func `let`<T>(_ block: (Self) throws -> T) rethrows -> T {
        return try block(self)
    }

    @inlinable
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

