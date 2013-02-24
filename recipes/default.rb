#
# Cookbook Name:: nagios-client
# Recipe:: default
#
# Copyright 2013, SourceIndex IT-Services
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

packages = [
    'nagios-nrpe-server',
    'nagios-plugins',
    'nagios-plugins-basic',
    'nagios-plugins-standard'
]

case node[:platform]
when "debian", "ubuntu"
    include_recipe 'apt'
end

packages.each do |pkg|
    package pkg do
        action :install
    end
end

directory node['nagios']['plugins']['thirdparty'] do
    owner "root"
    group "root"
    mode 0755
end

remote_directory node['nagios']['plugins']['thirdparty'] do
    source "plugins"
    owner "root"
    group "root"
    mode 0755
end

remote_directory node['nagios']['configs']['includes'] do
    source "configs"
    owner "root"
    group "root"
    mode 0755
end

template "#{node['nagios']['configs']['nrpe']}/nrpe.cfg" do
    source "nrpe.cfg.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, "service[nagios-nrpe-server]"
end

service 'nagios-nrpe-server' do
    action [:start, :enable, :reload]
    supports :restart => true, :reload => true, :status => true
end
