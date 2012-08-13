# TKH Content



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
