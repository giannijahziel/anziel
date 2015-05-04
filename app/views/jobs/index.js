<%# app/views/students/index.js.erb %>
<% js = escape_javascript(
  render(partial: 'jobs/list', locals: { jobs: @jobs })
) %>
$("#filterrific_results").html("<%= js %>");