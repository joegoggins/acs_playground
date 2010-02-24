class Poc1::Acs::Jqb::DogsController < ApplicationController
  # Yields json results given ?q=<SEARCH_TERM>
  #
  def index
    respond_to do |format|
      format.json {render :json => {
          :model => "Dog #{rand}",
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
        <input type="textfield" name="the_textfield" acs_source="/acs/jqb/dogs" id="the_textfield"/>
        
        <%= javascript_include_tag 'jquery-1.4.2' %>
        <% javascript_tag do %>
        // The most basic Autocompleter, now simply demonstrating it hits 
        // the server on load
        jQuery.fn.extend({
          bindAcs:function() {
            this.each(function() {
              var element = jQuery(this);
              Jqb.attach(element);
          })
        }
        })
        var Jqb = {
          loaded:false,
          attach:function(element) {
            element.data("acs_source", element.attr('acs_source'));
            element.focus(function(){
              //alert('fa fa focused' + element.data("acs_source"));
            }),
            element.keydown(function(event){
              $.getJSON(element.data("acs_source"), function(json) {
                alert(json.model);
              })
              /*
              If the first character is ? and there are no characters, then
              show the keyboard shortcut's for navigating the autocompleter
              
              Otherwise propogate the search term to the server
              
              */
              switch (event.keyCode) {
                // ...
                // different keys do different things
                // Different browsers provide different codes
                // see here for details: http://unixpapa.com/js/key.html    
                // ...
              }
              alert('po');
              return true;
              
            })
          }
        }
        $(document).ready(function(){
          $("input[acs_source]").bindAcs();
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
