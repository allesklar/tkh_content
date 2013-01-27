module PagesHelper
  def tkhed(content)
    content = content.gsub /\(-: contact_us_form :-\)/, render('contacts/form') if content.match(/\(-: contact_us_form :-\)/)
    content
  end
end
