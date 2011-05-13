Why is the trunk empty?
-----------------------

Borg development happens inside branches. Released versions live within the
tags/ folder.

Branches
--------
There is one branch for every past or currently supported rails version.
So, for example, a version of borg that runs on rails 2.3.2 is available inside

  branches/rails2.3.2/
  
If you wanna develop for borg, you should checkout the branch that targets the
Rails environment you are interested in. Usually borg is developed against the
most recent version of Rails and changes are backported to the previous versions
until they are supported.

Tags
----
There is one tag for every major borg release. Each release supports a single
version of Rails unless specified otherwise. So, for example borg 2.5 is
available inside

  tags/borg2.5/
  
and supports Rails 2.3.2 since it was created from that branch. 
Minor bugfixes and improvements are pushed directly onto the tag.

If you wanna deploy a version of borg, you should checkout the release tag you
are interested in. Running the occasional 'svn up' on the checked out code will
guarantee you to have the most recent patches applied.

Only backward-compatible changes are pushed onto tags, so you should always be
safe to run 'svn up' on release code.

-- May 2009, Riccardo Govoni <battlehorse@gmail.com>