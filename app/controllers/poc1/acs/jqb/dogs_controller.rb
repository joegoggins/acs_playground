class Poc1::Acs::Jqb::DogsController < ApplicationController
  # Yields json results given ?q=<SEARCH_TERM>
  #
  def index
    @stub1 = [{
        :model => "Dog #{rand}",
        :primary_keys => %w(id),
        :keys => %w(id),
        :mapping => %w(id name),
        :results => [
          [1,"golden retreiver"],
          [5,"golden donkey"]
        ]
      },
      {
          :model => "Dog #{rand}",
          :primary_keys => %w(id),
          :keys => %w(id),
          :mapping => %w(id name),
          :results => [
            [1,"golden retreiver"],
            [5,"golden donkey"]
          ]
        }
      ]
    respond_to do |format|
      format.json {render :json => @stub1} 
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
        
        <input type="textfield" name="the_textfield2" acs_source="/acs/jqb/dogs" id="the_textfield2"/>
        
        <%= javascript_include_tag 'jquery-1.4.2' %>
         
        
        <% javascript_tag do %>
        // Top Level function to bind an Auto-Completer to an HTML element
        // Should eventually extract autocompleter client name from a acs_source like "/acs/jqb_v2/dogs"
        // to invoke JqbV2.attach(element)
        jQuery.fn.extend({
          bindAcs:function() {
            this.each(function() {
              var element = jQuery(this);
              Jqb.attach(element);
          })
        }
        });
        
        // A namespace to hold all references to all Autocompleter client bindings
        // on this page
        var Acs = {
          instances:[]
        }
        
        // jQuery Basic Autocompleter for ACS API
        //
        var Jqb = {
          loaded:false,
          
          // This is like the constructor--where all of the base-line behavior associated
          // with a Jqb client can added to the page
          attach:function(element) {
            // Move the 
            element.data("acs_source", element.attr('acs_source'));
            element.focus(function(){
              //Do nothing
            }),
            element.keyup(this.handleKeyUp)
          },
          
          handleKeyUp:function(event) {
            var keyupped = event.target;
            console.log('[handleKeyUp] ' + $(keyupped).val());
            
            // Catch arrows, enter, tab
            // pass other stuff through to ajax request
            // should buffer key strokes and wait for the user
            // to finish typing (i think)
            //
            switch (event.keyCode) {
              //Catch/buffer/ depending on the key pressed
              // see here for details: http://unixpapa.com/js/key.html    
            }
            
            // Fire off request
            $.getJSON($(keyupped).attr('acs_source'), {q:$(keyupped).val()}, function(json) {
              jQuery.each(json, function() {
                console.log(this.model);
              });
            })
          }
          
          
        }
        
        
        // Starting point to attach the autocompleter server
        // to all clients on the page
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
