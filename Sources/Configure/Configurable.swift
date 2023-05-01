import Foundation

public protocol Configurable {}

public extension Configurable where Self: AnyObject {
    /// Sets the value of the property identified by the given key path.
    ///
    /// ```
    /// let label = UILabel()
    ///     .set(\.text, "text")
    ///     .set(\.textAlignment, .center)
    /// ```
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the property to set.
    ///   - value: The value to set.
    /// - Returns: The object being configured.
    @discardableResult
    @inlinable
    func set<T>(
        _ keyPath: ReferenceWritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    /// Executes the given closure with the object as its argument.
    /// 
    /// ```
    /// let label = UILabel().then {
    ///     $0.text = "text"
    ///     $0.textAlignment = .center
    /// }
    /// ```
    ///
    /// - Parameter block: The closure to execute.
    /// - Returns: The object being configured.
    @inlinable
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }
}

public extension Configurable where Self: Any {
    /// Sets the value of the property identified by the given key path.
    ///
    /// ```
    /// let label = UILabel()
    ///     .set(\.text, "text")
    ///     .set(\.textAlignment, .center)
    /// ```
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the property to set.
    ///   - value: The value to set.
    /// - Returns: The object being configured.
    @discardableResult
    @inlinable
    mutating func set<T>(
        _ keyPath: WritableKeyPath<Self, T>, _ value: T
    ) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    /// Executes the given closure with the object as its argument.
    ///
    /// ```
    /// let label = UILabel().then {
    ///     $0.text = "text"
    ///     $0.textAlignment = .center
    /// }
    /// ```
    ///
    /// - Parameter block: The closure to execute.
    /// - Returns: The object being configured.
    @inlinable
    func then(_ block: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try block(&copy)
        return copy
    }

    /// Mutates the object with the given closure.
    ///
    /// This method allows you to mutate an object by executing a closure with the object as its argument.
    ///
    /// ```
    /// view.frame.mutate {
    ///     $0.origin.x = 100
    ///     $0.size.width = 150
    /// }
    /// ```
    ///
    /// - Parameter block: The closure to execute.
    @inlinable
    mutating func mutate(_ block: (inout Self) throws -> Void) rethrows {
        try block(&self)
    }

    /// Applies the given closure to the object and returns the result.
    ///
    /// This method allows you to apply a closure to an object and return the result.
    ///
    /// ```
    /// let dateString = Date().let {
    ///     let formatter = DateFormatter()
    ///     formatter.format = "yyyy-MM-dd"
    ///     return formatter.string(from: $0)
    /// }
    /// ```
    ///
    /// - Parameter block: The closure to apply.
    ///
    /// - Returns: The result of applying the closure to the object.
    @inlinable
    func `let`<T>(_ block: (Self) throws -> T) rethrows -> T {
        return try block(self)
    }

    /// Executes the given closure with the object as its argument.
    ///
    /// This method allows you to execute a closure with the object as its argument.
    ///
    /// ```
    /// UserDefaults.standard.do {
    ///     $0.set(42, forKey: "number")
    ///     $0.set("hello", forKey: "string")
    ///     $0.set(true, forKey: "bool")
    /// }
    /// ```
    ///
    /// - Parameter block: The closure to execute.
    @inlinable
    func `do`(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}

