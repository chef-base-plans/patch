[![Build Status](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_apis/build/status/chef-base-plans.patch?branchName=master)](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_build/latest?definitionId=69&branchName=master)

# patch

## Maintainers

* The Core Planners: <chef-core-planners@chef.io>

## Type of Package

Binary package

### Use as Dependency

Binary packages can be set as runtime or build time dependencies. See [Defining your dependencies](https://www.habitat.sh/docs/developing-packages/developing-packages/#sts=Define%20Your%20Dependencies) for more information.

To add core/patch as a dependency, you can add one of the following to your plan file.

##### Buildtime Dependency

> pkg_build_deps=(core/patch)

##### Runtime dependency

> pkg_deps=(core/patch)

### Use as Tool

#### Installation

To install this plan, you should run the following commands to first install, and then link the binaries this plan creates.

``hab pkg install core/patch --binlink``

will add the following binary to the PATH:

* /bin/patch

#### Using an example binary

You can now use the binary as normal.  For example:

``/bin/patch --help`` or ``patch --help``

```bash
patch --help
Usage: patch [OPTION]... [ORIGFILE [PATCHFILE]]

Input options:

  -p NUM  --strip=NUM  Strip NUM leading components from file names.
  -F LINES  --fuzz LINES  Set the fuzz factor to LINES for inexact matching.
  -l  --ignore-whitespace  Ignore white space changes between patch and input.
...
...
```
