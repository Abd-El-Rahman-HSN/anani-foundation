# Initialize first account:
User.create! do |u|
    u.email     = 'admin@admin.com'
    u.password    = 'adminadmin'
    u.admin = true
end