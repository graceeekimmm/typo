require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

#copied the stuff above from web_steps.rb

Given /^that this user exists:$/ do |user_fields|
    params = {}
    user_fields.rows_hash.each do |key, value|
        params[key] = value
    end
    User.create!(params)
end

Given /^that this article exists:$/ do |article_fields|
    params = {}
    # article_fields.rows_hash.each do |key, value|
    #     params[key] = value
    # end
    article_fields.rows_hash.each do |name, value|
        if name=='user'
            params[name.to_sym] = User.where(:login=>value).first
        else
            params[name.to_sym] = value
        end
    end
    Article.create!(params)
end

Given /^that this comment exists:$/ do |comment_fields|
    params = {}
    comment_fields.rows_hash.each do |name, value|
        if name=='user'
            params[name.to_sym] = User.where(:login=>value).first
        elsif name=='article'
            params[name.to_sym] = Article.where(:title=>value).first
        else
            params[name.to_sym] = value
        end
    end
    Comment.create!(params)
end

Given /^that I am logged in as "([^"]*)"$/ do |user|
    account = User.where(:name=>user).first
    login = account.login
    password = account.password
    steps %Q{
        Given I am on the login page
        And I fill in "user_login" with "#{login}"
        And I fill in "user_password" with "#{password}"
        Then I press "Login"
    }
end

When /^I merge with the article "([^"]*)"$/ do |article_title|
    id = Article.where(:title=>article_name).guid
    steps %Q{
        I fill in "merge_with" with "#{id}"
        I press "Merge"
    }
end