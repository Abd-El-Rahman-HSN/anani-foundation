module SendGroupsHelper
	def send_group_status(status)
		if status == "closed"
			content_tag(:span, SendGroup.human_enum_name(:status, status), class: "label label-default")
		elsif status == "open"
			content_tag(:span, SendGroup.human_enum_name(:status, status), class: "label label-success")
		end
	end
end
