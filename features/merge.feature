Feature: merging as an admin
    As an admin
    In order to merge two similar articles
    I want to be able to merge two articles and preserve their texts and comments

Background:
    Given that the blog is set up
    Given that this user exists:
        | login        | nanyan                  |
        | password     | nyancat                 |
        | email        | nyannyan@gmail.com      |
        | profile_id   | 1                       |
        | name         | Nancy Yan               |
        | state        | active                  |
    Given that this user exists:
        | login        | brybryan                |
        | password     | teeheeno                |
        | email        | bryanmunar@gmail.com    |
        | profile_id   | 1                       |
        | name         | Bryan Munar             |
        | state        | active                  |
    Given that this article exists:
        | title       | Nyancat Says                                              |
        | user        | nanyan                                                    |
        | body        | Nancy: In eigth grade, I had a crush for every period     |
    Given that this article exists:
        | title       | In Munar's World       |
        | user        | munar                  |
        | body        | Bryan: I love kale     |
    Given that this comment exists:
        | article     | Nyancat Says        |
        | user        | munar               |
        | body        | HAHAHAHAAH OMG      |
        | author      | Bryan Munar         |
    Given that this comment exists:
        | article     | In Munar's World    |
        | user        | nyancat             |
        | body        | ugh please          |
        | author      | Nancy Yan           |


Scenario:
    Given that I am logged in as "admin"
    And I am on the edit page for "In Munar's World"
    Then I should see "Merge"
    When I merge with the article "Nyancat Says"
    Then I should see "In Munar's World"
    But I should not see "Nyancat Says"
    And I should see "Bryan Munar"
    But I should not see "Nancy Yan"
    When I follow "In Munar's World"
    Then I should see "Bryan: I love kale"
    And I should see "Nancy: In eigth grade, I had a crush for every period"