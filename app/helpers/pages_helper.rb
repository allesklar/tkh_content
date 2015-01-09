module PagesHelper

  def tkhed(content)
    content = generate_contact_form(content)
    content = generate_upcoming_events_list(content)    #
  end

  private

  def generate_contact_form(content)
    # general TKH CMS feature
    # the legacy syntax -- (-: contact_us_form :-)
    content = content.gsub(/\(-: contact_us_form :-\)/, render('contacts/form')) if content.match(/\(-: contact_us_form :-\)/)
    # the new syntax -- tkh_contact_form
    content = content.gsub(/tkh_contact_form/, render('contacts/form')) if content.match(/tkh_contact_form/)
    content
  end

  def generate_upcoming_events_list(content)
    # from the tkh_events gem
    content = content.gsub /tkh_upcoming_events/, render('events/upcoming_events_list') if content.match(/tkh_upcoming_events/)
    content
  end

end
