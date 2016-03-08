Feature: Merge Articles
  As a blog administrator
  In order to protect my blog posts
  I want to be able to control who merge articles
  
    Background:
      Given the blog is set up
      And I am logged into the admin panel
  
    Scenario: See Merge Articles
	  And the following articles exist:
		| id	| title         | body 	       | allow_comments | published | type    |
		|  1	| Hello World   | somethingA   | true           |   true    | Article | 
		|  2	| Introduction  | somethingB   | true           | true      | Article |
      When I go to the edit page for "Hello World"
      Then I should see "Merge Articles"
      
    Scenario: Merged articles should contain text of original articles
		And the following articles exist:
		|   id	| title           | body 	| allow_comments | type    | published |
		|  3	| Life of Pablo   | Kanye   | true           | Article | true |
		| 4     | untitled        | Kendrick| true           | Article | true |            
        When I go to the edit page for "Life of Pablo"
        Then I should see "Merge Articles"
        When I fill in "merge_with" with "4"
        And  I press "Merge"
        Then I should be on the admin content page
        Then I should see "Successfully merged articles"
        Then I should see "Life of Pablo"
        Then I follow "Life of Pablo"
        Then I should see "Kanye"
        Then I should see "Kendrick"
        

    
    Scenario: Merged articles should contain comments of original articles
		And the following articles exist:
		| id	| title         | body 	       | allow_comments | published | type    |
		|  1	| Hello World   | somethingA   | true           |   true    | Article | 
		|  3	| Introduction  | somethingB   | true           | true      | Article |
    	And the following comments exist:
	    | id	| type      | body 	        |  article_id   | author    | user_id   | 
		|  1	| Comment   | commentA      | 1             |  amaan    | 1         |
		|  2	| Comment   | commentB      | 3             |  amaan    | 1         |
	    And the following users exist:
        | profile_id | login  | name  | password    | email            | state  |
        | 1          | amaan | Amaan  | pass        | amaan@gmail.com  | active |
    	Given I merge articles "1" and "3"
    	And I am on the home page
    	When I follow "Hello World"
    	Then I should see "commentA"
    	Then I should see "commentB"