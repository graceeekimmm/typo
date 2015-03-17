Feature: merging as a non-admin
    As a non-admin
    In order to prevent unauthorized merges
    I want to be unable to merge two articles

Background:
    Given that the blog is set up
    Given that this user exists:
        | login        | qirene213               |
        | password     | kangster                |
        | email        | qirene213@gmail.com     |
        | profile_id   | 1                       |
        | name         | Irene Kang              |
        | state        | active                  |
    Given that this article exists:
        | title       | Her Royal Highness's Words  |
        | user        | qirene213                   |
        | body        | Irene: Call me the queen    |

Scenario:
    Given that I am logged in as "non-admin"
    Given I am on the edit page for "Her Royal Highness's Words"
    Then I should not see "Merge"