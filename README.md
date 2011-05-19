# Borg #
**Borg** is an ultra simple file-based Content Management System (CMS) built on top of Ruby On Rails. The code is kept voluntarily simple to handle only the needs of small, personal websites.

**Borg** is a wiki and blog that uses the [Textile](http://www.textism.com/tools/textile/) formatting for your contents.

**Borg** integrates with existing technologies and standards for greater flexibility :

* Authentication framework based upon [OpenID](http://www.openid.net/)
* Google services integration : Translate ( automatic page translation ), Chatback ( chat integration ), Analytics ( usage statystics )
* [Gravatar](http://en.gravatar.com/) for comment icons
* RSS feeds for content updates and user comments 

**Borg** stores all its data in plain text files on a filesystem:

* It doesn't force you to adopt a proprietary format
* you don't even need to setup a database 
* you can easily extract your data and move away from Borg the day you decide to change.
* you can read and manipulate your content with any other utility you may decide to use.
* the folder structure mimics the layout of your CMS, allowing easy customization

**Borg** offers many more functionalities:

* page metadata for extra attributes
* tagging and tag clouds
* breadcrumbs
* automatic sitemap and blog archives history
* easy layout customization
* multiple graphic templates (new in version _2.5_, updated in version _3.0_ with the bigG theme)
* hierarchical sidebars and toolbars
* user comments
* smart date formatting and parsing (new in version _2.5_)
* content editing directly from the browser, with drafts support (drafts are new in version _3.1_)
* Social features (Google Buzz, Facebook and Twitter sharing)(new in version _3.0_),
* Attachments and file upload support, including basic file management features (new in version _3.0_),
* Automatic Sitemap generation for better indexing (new in version _3.0_),
* Support for the latest serving stack: Rails 3.0.7 + Ruby 1.9.2,
* works on all major browsers ( Firefox, Safari, Opera, IE, Chrome )
* Full support for high-end mobile devices (iPhone, iPad, Android phones like the Nexus One and Nexux S, Android tablets)(new in version _3.0_)

## Screenshots ##

**bigG** template

<a href="http://www.battlehorse.net/borg-att/screenshots/bigg_list.png">
  <img style='float:left; border: 0'
       src='http://www.battlehorse.net/borg-att/screenshots/bigg_list_tb.png'>
</a>
<a href="http://www.battlehorse.net/borg-att/screenshots/bigg_page.png">
  <img style='float:left; border: 0'
       src='http://www.battlehorse.net/borg-att/screenshots/bigg_page_tb.png'>
</a>

<br style="clear:both" />

**InternetSharing** template

<a href="http://www.battlehorse.net/borg-att/screenshots/internet_sharing_list.png">
  <img style='float:left; border: 0'
       src='http://www.battlehorse.net/borg-att/screenshots/internet_sharing_list_tb.png'>
</a>
<a href="http://www.battlehorse.net/borg-att/screenshots/internet_sharing_tags.png">
  <img style='float:left; border: 0'
       src='http://www.battlehorse.net/borg-att/screenshots/internet_sharing_tags_tb.png'>
</a>

<br style="clear:both" />

**CoolWater** template

<img style='float:left; border: 0'
     src="http://www.battlehorse.net/borg-att/screenshots/borg1_tb.png">
<img style='float:left; border: 0'
     src="http://www.battlehorse.net/borg-att/screenshots/borg2_tb.png">
<img style='float:left; border: 0'
     src="http://www.battlehorse.net/borg-att/screenshots/borg3_tb.png">

<br style="clear:both" />

## Versions and Branches ##

* **rails3.0.7** branch: borg version tuned for rails 3.0.7 and ruby 1.9.2. Currently developed.
* **rails3.0.3**, **rails2.3.5** , **rails2.3.2**, **rails2.1.1** : borg versions tuned for previous rails versions. No longer maintained.

#### Releases ####

* **v3.1** tag : current (recommended) borg version, targeting rails 3.0.7.
  * deps: as declared in Gemfile.lock
* **v3.0** tag : targets rails 3.0.3.
  * deps: as declared in Gemfile.lock
* **v2.5** tag : targets rails 2.3.2
  * deps: rails/2.3.2 , RedCloth/4.1.9 , ruby-openid/2.1.6 , rubytree/0.5.2 , chronic/0.2.3
* **v2.0** tag : targs rails 2.1.2
  * deps: rails/2.1.2 , RedCloth/3.0.4 , ruby-openid/2.1.2 , rubytree/0.5.2

## Development ##

Want to contribute to borg development? It's easy.

First, Fork this git repo, following [these instructions](http://help.github.com/fork-a-repo/), and create a local clone on your machine:

    $ git clone git@github.com:your_user_name/borg.git
     
or you can simply just clone this git repository:

    $ git clone git://github.com/battlehorse/borg.git
    
Once you have everything on your local machine, make sure you have ruby1.9.2 installed:

    $ ruby -v
      ruby 1.9.2p180 (2011-02-18 revision 30909) [x86_64-darwin10.7.0]
      
or fetch and install it from [ruby-lang.org](http://www.ruby-lang.org/). You also need to have [gembundler](http://gembundler.com/) installed. Then move to the directory where you cloned the git repository
and issue the command

    $ bundle install
    
It will download all the gems that borg requires to run properly.

Next, open the file <code>lib/borg/config/borg_development.rb</code>. This is the main borg configuration file.
Read through the comments and instructions it contains and fill all the required information.

The main piece of information to provide is the location of borg repository, that is the set of directories where
borg will store all its contents (articles, comments, attachments).

The easiest way to set this up, is to start by creating a local clone of this git repository
(which contains a basic repository structure):

    $ git clone git://github.com/battlehorse/borg-data-empty.git
    
and then update <code>borg_development.rb</code> to point to the relevant directories within it.

You can now start your local borg instance:

    $ cd borg
    $ script/rails server

and point your browser to [http://localhost:3000](http://localhost:3000/).

## Deployment ##