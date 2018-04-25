module RequestMaterialsHelper
	def material_status(status)
		if status == "closed"
			content_tag(:span, RequestMaterial.human_enum_name(:status, status), class: "label label-default")
		elsif status == "open"
			content_tag(:span, RequestMaterial.human_enum_name(:status, status), class: "label label-success")
		end
	end
end
