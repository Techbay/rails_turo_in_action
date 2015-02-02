module ApplicationHelper
  
  #定义全站title格式helper
  def full_title(page_title='')
    base_title="Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title+" | "+base_title
    end
  end
  
end
