class Poc1::Acs::Jqb::DogsController < ApplicationController
  # Yields json results given ?q=<SEARCH_TERM>
  #
  def index
    respond_to do |format|
      format.json {render :json => {
          :model => "Dog",
          :primary_keys => %w(id),
          :keys => %w(id),
          :mapping => %w(id name),
          :results => [
            [1,"golden retreiver"],
            [5,"golden donkey"]
          ]
        }
      } 
    end
  end
  
  # Will yield data format similar to above
  # both will be ?q=1,5,10
  #
  def from_keys
  end
  
  # Yields a snippet of HTML that represents the text field
  # useful if you are utilizing the autocompleter externally
  # and just want to render the widget
  def widget
    respond_to do |format|
      format.html { render :inline => <<-EOS
        <html>
        <body>
        <input type="textfield" name="poo" />

        <%= javascript_include_tag 'jquery-1.4.2' %>
        <% javascript_tag do %>
        $(document).ready(function(){
          alert('funkem dat you <%= rand %>');
          $.getJSON('/acs/jqb/dogs', function(json) {
            alert(json.model);
          }) 
        });

        <% end %>
        </body>
        </html>  
      EOS
    }
    end
  end
  
  # Renders a server side code that can be used by external sites
  # to bind to this autocompleter
  #
  def proxy
    respond_to do |format|
      format.ruby {}
      format.perl {}
      format.php {}
    end
  end
  
  # Specifies the model, primary, key, attribute result set mappings,
  # tags, and filters to the client
  #
  def interface
    respond_to do |format|
      format.json {}
    end
  end

  # Javascript include files
  # to make the widget work
  #
  def js_includes
  end
  

end
