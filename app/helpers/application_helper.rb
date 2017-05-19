module ApplicationHelper
    def full_title(page_title = '')
        base_title = "Health For All Donor Management System"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end
    
    def sortable(column, title = nil)
        title ||= column.titleize
        css_class = (column == sort_column) ? "current #{sort_direction}" : nil
        direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
        link_to title, :sort => column, :direction => direction
    end
    
    def sort_column
      DonorProfile.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
