
<%= form_for [topic, post] do |f| %>
  <div class="form-group">
    <%= f.label :title %>
    <%= f.text_field :title, class: 'form-control', placeholder: "Enter post title" %>
  </div>
  <div class="form-group">
    <%= f.label :body %>
    <%= f.text_area :body, rows: 8, class: 'form-control', placeholder: "Enter post body" %>
  </div>
  <div class="form-group">
    <%= f.submit "Save", class: 'btn btn-success' %>
  </div>
<% end %>