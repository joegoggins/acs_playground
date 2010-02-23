class Poc1::DogsController < ApplicationController
  # GET /poc1_dogs
  # GET /poc1_dogs.xml
  def index
    @dogs = Poc1::Dog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dogs }
    end
  end

  # GET /poc1_dogs/1
  # GET /poc1_dogs/1.xml
  def show
    @dog = Poc1::Dog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dog }
    end
  end

  # GET /poc1_dogs/new
  # GET /poc1_dogs/new.xml
  def new
    @dog = Poc1::Dog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dog }
    end
  end

  # GET /poc1_dogs/1/edit
  def edit
    @dog = Poc1::Dog.find(params[:id])
  end

  # POST /poc1_dogs
  # POST /poc1_dogs.xml
  def create
    @dog = Poc1::Dog.new(params[:dog])

    respond_to do |format|
      if @dog.save
        flash[:notice] = 'Poc1::Dog was successfully created.'
        format.html { redirect_to(@dog) }
        format.xml  { render :xml => @dog, :status => :created, :location => @dog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poc1_dogs/1
  # PUT /poc1_dogs/1.xml
  def update
    @dog = Poc1::Dog.find(params[:id])

    respond_to do |format|
      if @dog.update_attributes(params[:dog])
        flash[:notice] = 'Poc1::Dog was successfully updated.'
        format.html { redirect_to(@dog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poc1_dogs/1
  # DELETE /poc1_dogs/1.xml
  def destroy
    @dog = Poc1::Dog.find(params[:id])
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to(poc1_dogs_url) }
      format.xml  { head :ok }
    end
  end
end
