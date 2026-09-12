
## data structures

**Entities**

- Collections / categories, acting as doors
- Notes, things that go inside collections, or are reachable from different doors
- Tags (optional, because they work the same way as collections and act as categories for things)

**Tables**

- Notes Table
- Collections Table
- Join Table between Notes and Collections (many to many relationship)

<aside> 💡

In sqlite3, there are two good ways to model many-to-many relationships between tables:

1. The traditional way of using a third table storing every combination of products and carts.
2. A more modern way might be to store product IDs in a shopping cart as a JSON array.

The two approaches have different upsides and downsides. With the traditional relational way, it's easier to ensure data integrity (by, for instance, deleting product references out of shopping carts when a product is deleted). On the other hand, queries are easier to write with JSON structures. Especially when the order of products in the shopping cart is important as well, a JSON list is very helpful since rows in a table are unordered. Picking the right approach is a design decision you'll have to make. [This page](https://drift.simonbinder.eu/examples/relationships/) describes both approaches and highlights some differences between them.

</aside>

- How to find recent usage history data?
    - Make views instead of new Tables? View for last week, last month, last year
    - Does it make sense to have a detailed history of each action?
        - Can be useful for the detailed view and for understand how each note is evolving
        - Can be used for data analysis and reports
        - Maintain history in SQL table or another way is better?