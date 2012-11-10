#
# Author:: Steven Danna(<steve@opscode.com>)
# Cookbook Name:: R
# Recipe:: default
#
# Copyright 2011, Steven S. Danna (<steve@opscode.com>)
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



case node['install_method']
when "package"
  include_recipe "r-project::package"
when "source"
  include_recipe "r-project::source"
end


when "centos", "redhat"
  # On CentOs and RHEL we install from source


# Setting the default CRAN mirror makes
# remote administration of R much easier.
template "#{r_install_dir}/etc/Rprofile.site" do
  mode "777"
  variables( :cran_mirror => node['R']['cran_mirror'])
end
