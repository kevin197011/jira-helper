# frozen_string_literal: true

# Copyright (c) 2023 kk
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

require 'rubygems'
require 'jira-ruby'
require 'dotenv'
require_relative 'config'

Dotenv.load

options = {
  username: ENV['jira_username'],
  password: ENV['jira_password'],
  site: ENV['jira_site'],
  context_path: '',
  auth_type: :basic
}

client = JIRA::Client.new(options)

# projects = client.Project.all

# projects.each do |project|
#   puts "Project -> key: #{project.key}, name: #{project.name}"
# end
#

# project = client.Project.find('SEDEV')
# pp project
# project.issues.each do |issue|
#   puts "#{issue.id} - #{issue.fields['summary']}"
# end

# issuetypes = client.Issuetype.all
# pp issuetypes

# issue = client.Issue.find('15188')
# pp issue

issue = client.Issue.build
labels = %w[zh]
issue.save({
             'fields' => {
               'summary' => @title.to_s,
               'description' => @description.to_s,
               'project' => { 'key' => 'SEDEV' },
               'issuetype' => { 'id' => '10005' },
               'labels' => labels,
               'priority' => { 'id' => '3' }
             }
           })

issue.fetch
issue.save({ 'fields' => { 'assignee' => { 'name' => 'Kevin' } } })
pp issue
