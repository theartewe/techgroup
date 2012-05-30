module ApplicationHelper
    def forward_zero_number(string)
        return string if string.to_s.size > 1
        return "0#{string}"
    end

    def wrap_in_p(string)
        if string.start_with?("<p>")
            return string.html_safe
        else
            return string.split("\n").collect{|s| "<p>#{s}</p>" }.join("\n").html_safe
        end
    end
end
