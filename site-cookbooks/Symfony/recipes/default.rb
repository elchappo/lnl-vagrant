#
# Cookbook Name:: Symfony
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "disable-default-site" do
  command "a2dissite default"
end

web_app "symfony" do
  application_name "symfony-app"
  docroot "/vagrant/web"
end