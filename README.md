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
* content editing directly from the browser
* Social features (Google Buzz, Facebook and Twitter sharing)(new in version _3.0_),
* Attachments and file upload support, including basic file management features (new in version _3.0_),
* Automatic Sitemap generation for better indexing (new in version _3.0_),
* Support for the latest serving stack: Rails 3.0.3 + Ruby 1.9.2,
* works on all major browsers ( Firefox, Safari, Opera, IE, Chrome )
* Full support for high-end mobile devices (iPhone, Android phones like the Nexus One and Nexux S)(new in version _3.0_)

## Screenshots ##

**bigG** template

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

* **rails3.0.3** branch: borg version tuned for rails 3.0.3 and ruby 1.9.2. Currently developed.
* **rails2.3.5** , **rails2.3.2**, **rails2.1.1** : borg versions tuned for previous rails versions. No longer maintained.

#### Releases ####

* **v3.0** tag : current (recommended) borg version, targeting rails 3.0.3.
  * deps: as declared in Gemfile.lock
* **v2.5** tag : targets rails 2.3.2
  * deps: rails/2.3.2 , RedCloth/4.1.9 , ruby-openid/2.1.6 , rubytree/0.5.2 , chronic/0.2.3
* **v2.0** tag : targs rails 2.1.2
  * deps: rails/2.1.2 , RedCloth/3.0.4 , ruby-openid/2.1.2 , rubytree/0.5.2

## Deployment ##

## Development ##

