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
# 		And the following articles exist:
# 		| id	| title         | body 	    | type    | published | 
# 		|  1	| Hello World   | hello     | Article | true | 
# 		|  3	| Introduction  | world     | Article | true |  
		And the following articles exist:
		| id	| title         | body 	       | allow_comments | type    | published |
		|  1	| Hello World   | somethingA   | true           | Article | true |
		|  3	| Introduction  | somethingB   | true           | Article | true | 
# 		Given I merge articles "1" and "3"
# 		And I am on the home page
#         # Then I should not see "Introduction"
#         Then I should see "Hello World"
        # When I go to the edit page for "Hello World"
        # Then I should see "Merge Articles"
		
  
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