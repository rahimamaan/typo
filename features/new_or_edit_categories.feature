Feature: Write Articles
  As a blog administrator
  In order to organize my blog posts
  I want to be able to add and edit blogging categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add category
    When I go to the Categories page 
    When I fill in "category_name" with "Name"
    And  I press "Save"
    Then I should see "Category was successfully saved."
  
  Scenario: Index
    When I go to the Categories page
    Then I should see "Categories"
    
    
    
