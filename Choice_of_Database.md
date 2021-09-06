
# Criteria
* App architecture (web/standalone/monolith/microservice/mobile)
* Structure of the data (Big data, basic connections, complex data)
* Data access (Query complexity/aggregations/joins/multiple tables/multiple databases)
    * Scalability (traffic profile) (how many users/ concurrent queries/ predictability)
    * Read-write profile
* ACID requirements?
    * Atomicity: a transaction will either complete in its entirety or will have no effect at all on failure.
    * Consistency: a transaction will never violate any constraint rules of the database.
    * Isolation: multiple transactions running at the same will not affect each other.
    * Durability: Once committed (complete), the effects of a transaction will persist even after a system failure.

# Database Types
* Relational Database
* Non-relational Database 
    * Document-store
    * Key-value store
    * Graph store


# Exercise
* A system for processing payments that requires strong guarantees around data integrity, and that only the most up-to-date balance will be reported for a user.
> Relational Database as we require strong ACID properties

* An inventory management application for a large warehouse. Workers use handheld scanners to check inventory into and out of the warehouse.
> Relational Database. Not complex data requirements or huge load to justify Non-SQL database.

* A professional networking site which recommends introductions to users based on information about how they have worked with mutual acquaintances in the past. Details tracked include the organisations users worked together at, how long they collaborated and what field they were working in.
> Graph store. Complex relationships between acquaintances/companies. ACID enforcement is not required.

* A micro-service to store and retrieve the content's of the current user's shopping cart for an e-commerce website, which expects to see large spikes of traffic at certain times of year
> Key-value store as it's lightweight and scalable.

* A high-traffic software-as-a-service content management system, with many users extending the functionality of the system by defining custom content types.
> Document store as we need flexibility in the content types without limiting the usability.

* A search and match system for an international stem cell registry. The registry holds genetic information for millions of potential donors across the world.
> Relational database as it's low scale and requires less scalability.

* A voter registration system that sees extremely high spikes in demand in the run up to elections but is otherwise quiet. The system is not responsible for storing the electoral roll.
> Non-relational database for processing later as a queue. Easier to scale and to develop. Mobile.

* A new end-to-end encrypted messaging app preparing to disrupt the industry.
> Document-store. Scalable quickly in case it kicks off. Flexible to add new features.

* A new banking app being created by the "Digital Innovation" department at a long established bank. The Innovation department is tasked with delivering exciting new features as quickly as possible.
> Document-store. Flexible, scalable and easy to come up with innovations.

* An inventory management application for museums across the world to share information about their collections.
> Relational database. Simplicity.

* A contact tracing app, allows users to report a positive test for an infection and anonymously inform people they've interacted with while infectious.
> Microservice. Relational DB.

* A program to coordinate emergency services and NGOs responding to a natural disaster in a remote location.
> Relational DB.