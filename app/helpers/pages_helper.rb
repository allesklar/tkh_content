module PagesHelper
  def tkhed(content)
    content = content.gsub /\(-: contact_us_form :-\)/, render('contacts/form') if content.match(/\(-: contact_us_form :-\)/)
    # from what will be the tkh_yoga_center_gem
    content = content.gsub /\(-: dropin_class_schedule :-\)/, render('dropin_classes/schedule') if content.match(/\(-: dropin_class_schedule :-\)/)
    # from what will be the tkh_upcoming_events_gem
    content = content.gsub /\(-: upcoming_events_list :-\)/, render('events/upcoming_events_list') if content.match(/\(-: upcoming_events_list :-\)/)
    content
  end
end
