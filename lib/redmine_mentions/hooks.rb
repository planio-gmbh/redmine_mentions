module RedmineMentions
  class Hooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context={})
      libraries = [
        javascript_include_tag('tribute.min.js', :plugin => 'redmine_mentions'),
        (stylesheet_link_tag 'tribute.css', :plugin => 'redmine_mentions')
      ]
      return libraries.join(' ')
    end

    render_on :view_issues_edit_notes_bottom, :partial => 'hooks/redmine_mentions/edit_mentionable'
    render_on :view_issues_form_details_bottom,  :partial => 'hooks/redmine_mentions/edit_mentionable'
  end
end
