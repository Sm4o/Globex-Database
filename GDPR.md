# Part 2 - Avoiding Prosecution

Potential problems

* Personal data that may be covered by GDPR:
    * (_high_) Employee Union Membership Number
    * (_medium_) User Gender and DoB
    * (_medium_) Employee National Insurance Number
    * (_medium_) Employee phone number
    * (_low_) Supplier contact details
    * (_low_) Employee Emergency contact detail
* Other sensitive data that might be being stored incorrectly:
    * (_high_) User Password
    * (_high_) User Card details
    * (_medium_) Employee Bank details
* Any other structural problems:
    * (_low_) Avoid table/column names from restricted SQL keywords, like `order` and `date`.
    * (_low_) `Order.Amount` column should be of type integer.
    * (_low_) Naming columns that are ID properly, e.g. `ProductId` instead of just `Product` as it can be confused with the product name or a table named the same.

## 2.2: Find the solutions

* Personal data that may be covered by GDPR:
    * (_high_) Employee Union Membership Number
        <details><summary>Solution</summary>If business wants to keep it, find a legal basis for storing it based on <a href='ico.org.uk/for-organisations/ guide-to-data-protection/guide-to-the- general-data-protection-regulation-gdpr/ special-category-data/what-are-the-rules-on- special-category-data'>Article 9</a></details>
    * (_medium_) User's date of birth
        <details><summary>Solution</summary>Request consent from the user</details>
    * (_medium_) Employee National Insurance Number
        <details><summary>Solution</summary>Request consent from the user also it would be best to encrypt it</details>
    * (_medium_) Employee phone number
        <details><summary>Solution</summary>Request consent from the user</details>
    * (_low_) User Gender
        <details><summary>Solution</summary>Request consent from the user and find a legal reason why it needs to be stored</details>
    * (_low_) Supplier contact details
        <details><summary>Solution</summary>Request consent from the supplier</details>
    * (_low_) Employee Emergency contact detail
        <details><summary>Solution</summary>Ask employee to confirm their emergency contact agrees to giving their details</details>
* Other sensitive data that might be being stored incorrectly:
    * (_high_) User Password
    * (_high_) User Card details
    * (_medium_) Employee Bank details
    <details><summary>Solution</summary>Hash passwords with non-reversible secret key (sha256). Symmetric algorithm to encrypt bank details. Keep up to date with latest hashing/encryption innovations. Store key in vault/cloud.</details>
* Any other structural problems:
    * (_high_) The password of the database is not robust.
        <details><summary>Solution</summary>Encrypt and apply salting algorithm</details>
    * (_high_) Least privilege principle states we shouldn't use `sa` (admin user) for regular queries. 
    * (_low_) Avoid table/column names from restricted SQL keywords, like `order` and `date`.
    * (_low_) `Order.Amount` column should be of type integer.
    * (_low_) Naming columns that are ID properly, e.g. `ProductId` instead of just `Product` as it can be confused with the product name or a table named the same.


## 2.3: Create a test database

