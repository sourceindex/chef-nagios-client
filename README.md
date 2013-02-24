# Chef nagios-client Cookbook #
A simple cookbook for Opscodes Chef open-source systems integration framework to install and configure Nagios or Icinga's monitoring-client and -plugins.

# Requirements #

## Platform ##
The Cookbooks is build and tested for the following platforms:
* Debian 6.0.6
* Ubuntu

## Attributes ##

```json
{
  "nagios": [
    "server": "192.168.0.100"
  ]
}
```

# Usage #
Just include `nagios-client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nagios-client]"
  ]
}
```

# License and Authors #

Author: Sebastian Wendel, (<packages@sourceindex.de>)

Copyright: 2013, SourceIndex IT-Serives

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

![Tracking Pixel](https://tracking.sourceindex.de/piwik.php?idsite=5&amp;rec=1)
