# TKH Content




## 0.9.9

* Added tag resource and tag section in admin panel


## 0.9.8

* Full implementation of blog tags


## 0.9.7

* Aesthetic changes to play better with Bootstrap 3 and Rails 4


## 0.9.6

* Removed the pages js coffee file and moved code to tkh_admin_panel gem under admin folder


## 0.9.5

* Debugged the drag and drop reordering of the pages in the page admin sidebar


## 0.9.4

* Fixed up buttons in the comments section of admin panel


## 0.9.3

* Fixed the contact email validation format regex


## 0.9.2

* Fixes and tweaks related to the update to Rails 4
* Connected gem to tkh_authentication partial in comment area
* Updated many gems/dependencies


## 0.9

* Upgraded to Ruby 2.0 and Rails 4


## 0.4.6

* Added a dynamic content variable for upcoming events list


## 0.4.5

* Configured CKEditor so that it does not override classes and other bits of HTML code created by the user in the source.


## 0.4.4

* Admin can change page author
* Changed a couple translation strings for flash notice of new contact message creation


## 0.4.3

* Turned off browser autocomplete for pages form parent page field
* Changed neutral links in tab admin menus
* Added the dropin class schedule partial to the happy DSL
* Removed label from pending comments view. The span tag wouldn't wrap


## 0.4.2

* In the admin section of the pages' sidebar, added links to admin panel and to the unmoderated comments when any
* Pages sidebar admin section title is now capitalized to fit with the other sidebar sections
* Fixed translations of comments section admin tabs
* Removed justify button from CKEditor toolbar
* Special CSS class for a comment by the page's author
* Added generation of canonical link in pages show and in blog index views
* Modified display of comments and their count in the blog meta info partial
* Created a comments atom feed
* Converted blog feed from RSS to atom


## 0.4.1

* Debugged blog post meta partial


## 0.4

* Added tab admin menu navigation in all sections
* Set up many, many translations
* Refactored contact mailer


## 0.3.1

* CKEditor strips formatting from text during pasting


## 0.3

* Added a comment resource and integrated it with the page show views.
* Added a few translations. Many more to do


## 0.2.1

* Debugged, and therefore enabled, the autocomplete of the parent page title in pages form
* Added a second 'create a new page' button to the top of the pages index view when there are at least 5 pages
* Added H1 headings to page views


## 0.2

* Removed the tkh_inline_editor dependency
* Customize with javascript which fields are seen in the pages form according to whether the page is of static content page or is a blog post
* Implemented, customized, and internationalized the CKEditor html inline editor


## 0.1.15

* Debugged pages migrations. short_title attribute was missing in pages table
* Meta title for blog home page is company name instead of blog name
* Fixed bug meta partial for when blog post is not yet published_at


## 0.1.14

* Fixed typo. Bad German in the contact form submit button.


## 0.1.13

* Minor heading change in pages admin context menu


## 0.1.12

* Translated submit button of contact form


## 0.1.11

* Added some translations to the contact form area


## 0.1.10

* Added an admin section in sidebar of non-blog pages


## 0.1.9.3

* Modified labels in contact_us form partial
* Improved styling and display for the show view of content pages and blog posts
* Added a new datetime locale format
* Administrators get an 'edit' button in the meta info of blog posts
* Added indices to page model
* Pages have a menu_position attribute and can easily be reordered in combination with the tkh_menus gem


## 0.1.9.1 & 0.1.9.2

* Debugging
* Enable admin user to embed contact form in any page using happy DSL


## 0.1.9

* Removed inline editor. Will add another one soon
* Created a contact form


## 0.1.8

* Some debugging


## 0.1.7

* Added tags to blog
* Added autocompletion of parent page field in page form


## 0.1.6

* Added inline HTML editor to the pages form


## 0.1.5

* Added blog RSS feed


## 0.1.4

* Added pagination to the pages index method.
* Added pagination to blog home page.
* The user CANNOT delete the home page. For any reason whatsoever.
* Minor improvements to blog
* Translated German strings.


## 0.1.3

* Debugged blog controller index method query. Now it's properly returning blog posts by most recently published and without offset. Still need to do the pagination.


## 0.1.2

* Refactored generation of short_title attribute. Moved it to the create_pages migration to avoid conflict in globalize3.


## 0.1.1

* Creation of blog section
* Page title in h1 in show view only for blog posts
* Refactored meta_title generation
* Added short title page attribute mostly used for menus
* Pages act as a tree to build menu system
* Pages are either published or draft according to published_at attribute
* Needs a shared/menus partial or the tkh_menus gem
* Cleaned up some locale files and added the German locale but it's not translated yet


## 0.1

* Reverted pages show route to that one of a normal resource
* Added a belongs_to author association with migration and everything
* Added a migration to add a parent_id page attribute in preparation to menu building
* Improved pages index view with more info
* Removed erroneous instruction from README file


## 0.0.3.1

* Debugged the special page show route. It has to come last in order not to conflict with other routes


## 0.0.3

* The blog layout file is being copied to the host app during install or update
* The pages show route does not show controller name


## 0.0.2

* Use switch_to_admin_layout method in pages controller
* Fixed edit_page_path in buttons of index view
* Fixed submit button syntax in form partial
* Added for_blog to page accessible attributes
* Added a blog layout. Show action renders this layout for appropriate blog posts


## 0.0.1

* Initial release
