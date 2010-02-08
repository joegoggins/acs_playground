class DogsController < ApplicationController


  def acs_example1
    @dogs = [Dog.first,Dog.last]

    respond_to do |format|
      format.json { render :json => @dogs.to_json }
    end
  end
  
  def jquery_clustered
  end
end
